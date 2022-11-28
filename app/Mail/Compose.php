<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Compose extends Mailable
{
    use Queueable, SerializesModels;
    public $subject;
    public $details;
    
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($details,$subject)
    {
         $this->subject = $subject;
         $this->details = $details;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subject)->view('/admin/compose_mail');


        ///return $this->view('mail.welcome')
        //->from('hello@q-software.com', 'Q Software')
        //->subject('Hello & Welcome!')
        //->replyTo('hello@q-software.com', 'Q Software')
    }
}
