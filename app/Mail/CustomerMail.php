<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Mail\Swift_Message;
use App\Models\Ticket;
use Illuminate\Support\Facades\DB;
class CustomerMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $details; 
     /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($details)
    {
        $this->details = $details;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
            $ticketid=$this->details['ticno'];
            
             return $this->markdown('admin.autoresponse')
           ->withSwiftMessage(function($message) use ($ticketid,&$message_id) {

            $message_id = $message->getId();
            $message_id ="<".$message->getId().">";
             Ticket::where('ticket_number',$ticketid)->update([ 'message_id1'=> $message_id ]);
        });

           

 
    }
}
