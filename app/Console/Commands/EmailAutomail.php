<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Email;
use App\Mail\CustomerMail;
use Mail;
use DB;

class EmailAutomail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Email:Automail';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $Email = Email::select('*')
        ->where('email_send','=', 0)
        ->where('type','=','manual')
        ->where('compose_mail','=','comp')
        //->orwhere('compose_mail','=',null)
        ->where('page','=','SEN')
        ->get();

            if(count($Email) > 0){
               //$cc_address=''; 
            foreach ($Email as $key => $Emails) {
                $cc_address=$Emails->cc_address;
               
                $email=$Emails->to1;
                $str_name = explode("@", $email);
                $customer_name = $str_name[0];

                $custname=explode("@",$cc_address);
                $cust_name = $custname[0];                
                
                if($email == 'support@shelladvantagerewards.in'){

                $autoresponse = '';
                }else{
                $autoresponse = explode(",", $email);   
                } 
                //$subject=$Emails->subject;
                //$details=$Emails->message;
                $ticno=$Emails->ticket_number;
                $subject='Shell Advantage Support Ticket #'.$ticno.'#';
                $details = array(
                 'ticno'=> $Emails->ticket_number,
                 'customer_name' => $customer_name,
                 'subject' => 'Shell Advantage Support Ticket #'.$ticno.'#',
                 'autoresponse' => $autoresponse,
               );
             
            
            Mail::send('admin.customer_mail', $details, function($message)  use($autoresponse,$customer_name,$subject,$cc_address,$cust_name) {
                $message->to($autoresponse, $customer_name)->subject($subject);
                //$message->cc($cc_address, $customer_name)->subject($subject);
                $message->from('support@shelladvantagerewards.in','Shell Share');
                
        });
          Email::where('id',$Emails->id)->update([ 'email_send'=> 1 ]);   
            
            }
    }

    
    }
}
