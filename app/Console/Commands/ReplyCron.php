<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Email;
use App\Models\Email_attachment;
use App\Mail\Myreply;
use Mail;
use DB;


class ReplyCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
  

    protected $signature = 'Reply:cron';

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
      
      
      $Email = Email::select('*')->where('email_send','=', 0)->where('page','=','SEN')->where('type','=','manual')->where('send_type','=','reply')->get();


            if(count($Email) > 0){
               $cc_address=''; 
            foreach ($Email as $key => $Emails) {
                
                $email = $Emails->to1;
                $uid = $Emails->uid;
                $id = $Emails->id;
                 $tomail = explode(",", $email);

                 //dd($tomail);die();
                 //$str_name = explode("<", $email);
                 //$email = $str_name[0];
                
                //$email = preg_replace("/[>]/", "", $str_name[1]);
                 
                $subject=$Emails->subject;
                $details=$Emails->message;
                $cc_address_check=$Emails->cc_address;
                $cc_address=$Emails->cc_address;
                $cc_address = explode(",", $cc_address);
               Email::where('id',$id)->where('page','=','SEN')->update([ 'email_send' => '1' ]);

                 
               $Email_attachment = Email_attachment::select('*')->where('uid','=', $uid)->get();  
                  if (!empty($cc_address_check))
                  {
                   Mail::to($tomail)->cc($cc_address)->send(new Myreply($details,$subject));
                   if(count($Email_attachment) > 0){
                    foreach ($Email_attachment as $Email_attachments)
                     {
                        $this->attach($Email_attachments->file);
                     }
                    }
                   
                  }else{
                    Mail::to($tomail)->send(new Myreply($details,$subject));
                    if(count($Email_attachment) > 0){
                    foreach ($Email_attachment as $Email_attachments)
                     {
                        $this->attach($Email_attachments->file);
                     }
                    }
                    
                  }

            
            }
           
         }

   /* $Email = Email::select('*')->where('email_send','=', 0)->where('page','=','SEN')->get();
         if(count($Email) > 0){
            foreach ($Email as $key => $Emails) {
                //if(empty($Emails->cc_address))
                $email=$Emails->from1;
                 $str_name = explode("<", $email);
                 $email = $str_name[0];
                
                $email = preg_replace("/[>]/", "", $str_name[1]);
                
                $subject=$Emails->subject;
                $message=$Emails->message;*/
                //Mail::to('sunil@vert-age.com')->send(new Myreply('xyz'));
                //$this->info('Every minutes has been sent successfully');
            //}
           //Email::where('id',$Emails->id)->update(['email_send'=>'1']);
         //}*/
       /*$EmptyTestArray = array_filter($this->details['cc_mail']);

            if (!empty($EmptyTestArray))
              {
                //dd('sunil');
                // do some tests on the values in $ArrayOne
                $this->to($this->details['forword_mail'])->from($this->subject)->subject($this->subject)->cc($this->details['cc_mail']);
                     if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    } 
                  $this->info('every Minute report has been sent successfully');  
              }
            else
              {
                 $this->to($this->details['forword_mail'])->subject($this->subject);
                   if(!empty($this->details['files'])){
                     foreach ($this->details['files'] as $file)
                     {
                        $this->attach($file);
                     }
                    }
                 $this->info('every Minute report has been sent successfully');   
              }
            
       
      
     return  $this; */


    }
}
