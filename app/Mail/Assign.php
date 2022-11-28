<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Assign extends Mailable
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
         return $this->subject('Successfully Assign by Ticket for Agent')->view('/admin/assign_mail');
        //return $this->view('view.name');
        //return $this->view('view.name');
    }
}
