<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use App\Models\Email;
use App\Mail\CustomerMail;
use Mail;
use DB;

class ReceiveIndex extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Receive:Index';

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
        ->where('page','=','IN')
        ->where('references','=','')
        ->get();
            if(count($Email) > 0){
               //$cc_address=''; 
            foreach ($Email as $key => $Emails) {
                
                $email=$Emails->from1;
                //if($email=='support@shelladvantagerewards.in'){

                //}else{
                    $str_name = explode("<", $email);
                    if(empty($str_name[1])){
                    $customer_name = $str_name[0];
                        if($str_name[0] == 'support@shelladvantagerewards.in'){

                        //$autoresponse = $str_name[0];
                        }else{
                         $autoresponse = $str_name[0];   
                        }    
                    }else{
                    $customer_name = $str_name[0];    
                    $autoresponse = preg_replace("/[>]/", "", $str_name[1]);
                    }
                //}
                /*$str_name = explode("<", $email);
                $customer_name = $str_name[0];
                $autoresponse = preg_replace("/[>]/", "", $str_name[1]);*/
                 
                 //$subject=$Emails->subject;
                 $ticno=$Emails->ticket_number;
                 $subject='Shell Advantage Support Ticket #'.$ticno.'#';
                 //$details=$Emails->message;
                 $details = array(
                 'ticno'=> $Emails->ticket_number,
                 'customer_name' => $customer_name,
                 'subject' => $subject,
                 'autoresponse' => $autoresponse,
               ); 
                
               Email::where('id',$Emails->id)->update([ 'email_send'=> 1 ]);
                //$cc_address=$Emails->cc_address; 
            //if (!empty($cc_address))
                 // {
                   //Mail::to($autoresponse)->cc($cc_address)->send(new CustomerMail($details));
                  
                 // }else{
                   //Mail::to($autoresponse)->send(new CustomerMail($details));
         //$data = ['email'=>$autoresponse, 'subject'=>$subject, 'customer_name'=>$customer_name, 'ticno'=> $ticno ];
       return Mail::send('admin.customer_mail', $details, function($message)  use($autoresponse,$customer_name,$subject) {
                 $message->to($autoresponse, $customer_name)->subject($subject);
                $message->from('support@shelladvantagerewards.in','Shell Share');
            
        });
                //}
              
              
            }
    }

  }
}
