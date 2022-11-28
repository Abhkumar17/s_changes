<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Myforword extends Mailable
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
        
       $EmptyTestArray = array_filter($this->details['cc_mail']);

            if (!empty($EmptyTestArray))
              {
                //dd('sunil');
                // do some tests on the values in $ArrayOne
                $this->subject($this->subject)->cc($this->details['cc_mail'])->view('/admin/msg_myforword');
                     if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    } 
              }
            else
              {
                 $this->subject($this->subject)->view('/admin/msg_myforword');
                   if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    }
              }

      return $this;
    }
}
