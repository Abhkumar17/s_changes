<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMail;
use App\Mail\Compose;

class MailController extends Controller
{
   public function html_email(Request $request) 
   {
      $id=$request->hdn;
      $to1=$request->to1;
      $subject=$request->subject;
     
      $data = array(
         'name'=> $request->name,
         'subject' => $request->subject,
         'comment' => $request->comment
      );

      Mail::to($to1)->send(new SendMail($data,$subject));

        if(Mail::failures())
            {
              return back()->with('error', 'mail not sent some error!');
            
             }else{
              return back()->with('success', 'Thanks for contacting us!');
             }
       
   }
}
