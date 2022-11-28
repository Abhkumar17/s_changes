<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MyTestforword extends Mailable
{
    use Queueable, SerializesModels;
    public $details;
    public $subject;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($details,$subject)
    {
        $this->details = $details;
        $this->subject = $subject;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $this->subject($this->subject)
                    ->view('admin.myTestforword');
  
        foreach ($this->details['files'] as $file){
            $this->attach($file);
        }
  
        return $this;
    }
}
