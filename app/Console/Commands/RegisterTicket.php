<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Ticket;
use App\Mail\CustomerMail;
use Mail;
use DB;

class RegisterTicket extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Register:Ticket';

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

        
    $Ticket = Ticket::select('*')->where('send_mail','=', 0)->where('source','!=', 'Email')->get();
        if(count($Ticket) > 0){
          foreach ($Ticket as $key => $Tickets) {
            $details = array(
                 'ticno'=> $Tickets->ticket_number,
                 'customer_name' => $Tickets->customer_name,
                 'subject' => $Tickets->subject,
                 'autoresponse' => $Tickets->email_id,
               );
            $ticno= $Tickets->ticket_number;
            $subject='Shell Advantage Support Ticket #'.$ticno.'#';
            $customer_name = $Tickets->customer_name;
            $autoresponse=$Tickets->email_id;
            Ticket::where('id',$Tickets->id)->update([ 'send_mail'=> 1 ]);
            //Mail::to($email)->send(new CustomerMail($details));
            return Mail::send('admin.customer_mail', $details, function($message)  use($autoresponse,$customer_name,$subject) {
                 $message->to($autoresponse, $customer_name)->subject($subject);
                $message->from('support@shelladvantagerewards.in','Shell Share');
            
            }); 
            
          }
        }
    }
}
