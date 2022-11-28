<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Myreply extends Mailable
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

        return $this->markdown('admin.customer_mail_send');



        /* $EmptyTestArray = array_filter($this->details['cc_mail']);

            if (!empty($EmptyTestArray))
              {
                //dd('sunil');
                // do some tests on the values in $ArrayOne
                $this->to($email)->subject($this->subject)->cc($this->details['cc_mail'])->view('/admin/customer_mail_send');
                     if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    } 
              }
            else
              {
                 $this->subject($this->subject)->view('/admin/customer_mail_send');
                   if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    }
              }
    
     return  $this;*/

    }
}
