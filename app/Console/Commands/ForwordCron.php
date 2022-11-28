<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ForwordCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Forword:cron';

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
        $Email = Email::select('*')->where('email_send','=', 0)->where('page','=','SEN')->get();
            if(count($Email) > 0){
               $cc_address=''; 
            foreach ($Email as $key => $Emails) {
                
                  $email = $Emails->to1;
                  $uid = $Emails->uid;
                  $id = $Emails->id;
                  $tomail = explode(",", $email);
                  
                  
                if($tomail == 'support@shelladvantagerewards.in'){

                //$autoresponse = $str_name[0];
                }else{
                $tomail = $tomail;   
                } 

                 //dd($tomail);die();
                 //$str_name = explode("<", $email);
                 //$email = $str_name[0];
                
                //$email = preg_replace("/[>]/", "", $str_name[1]);
                 
                 
                $subject=$Emails->subject;
                $details=$Emails->message;
                $cc_address=$Emails->cc_address;
                $cc_address_check=$Emails->cc_address;
                $cc_address = explode(",", $cc_address);
                 if($cc_address == 'support@shelladvantagerewards.in'){

                //$autoresponse = $str_name[0];
                }else{
                $cc_address = $cc_address;   
                } 
               Email::where('id',$id)->where('page','=','SEN')->update([ 'email_send'=> '1' ]);

                 
               $Email_attachment = Email_attachment::select('*')->where('uid','=', $uid)->get();  
               if (!empty($cc_address_check))
                  {
                   Mail::to($tomail)->cc($cc_address)->send(new Myreply($details,$subject));
                   if(count($Email_attachment) > 0){
                    foreach ($Email_attachment as $Email_attachments)
                     {
                        attach($Email_attachments->file);
                     }
                    }
                   
                  }else{
                    Mail::to($tomail)->send(new Myreply($details,$subject));
                    if(count($Email_attachment) > 0){
                    foreach ($Email_attachment as $Email_attachments)
                     {
                        attach($Email_attachments->file);
                     }
                    }
                    
                  }

            
            }
           
         }
    }
}
