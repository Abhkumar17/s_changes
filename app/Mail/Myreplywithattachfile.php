<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Myreplywithattachfile extends Mailable
{
    use Queueable, SerializesModels;

     public $details;
     public $files;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($details,$files)
    {
        $this->details = $details;
        $this->files = $files;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //return $this->view('view.name');
        //$this->subject($this->details['subject'])->view('/admin/emailattached');
          
        return $this->subject($this->details['subject'])
                ->attach($this->files)
                ->view('/admin/emailattached');

        //foreach ($this->details['files'] as $file){
           // $this->attach($file);
       // }
  
       /// return $this;
    }
}
