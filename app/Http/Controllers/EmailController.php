<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Datatables;
use Auth;
use Session;
use App\Models\User;
use App\Models\Ticket;
use App\Models\Categorysub;
use App\Models\Status;
use App\Models\Product;
use App\Models\Department;
use App\Models\Logfiles;

use App\Models\Email;
use App\Models\Email_send;
use App\Models\Email_attachment;
use App\Models\Processemail;
use App\Models\Processlist;
use App\Models\Tablefleldlist;
use App\Mail\Compose;
use App\Mail\Myreply;
use App\Mail\Myforword;
use App\Mail\MyTestforword;
Use App\Mail\MyTestMail;
use App\Models\Customer;

use File;
use App\Shipment;
use App\Shipment_Attachment;



class EmailController extends Controller
{
    public function showEmail(Request $request)
    {
    	 $pa=$request->page;

         if (Auth::user()->user_type == "Admin") {
         if($pa=='IN'){
         $Data = Email::select('*')->where('page','=', $pa)
    	  ->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='STA'){
         $Data = Email::select('*')->where('starred','=', '1')
        ->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='IMP'){
         $Data = Email::select('*')->where('important','=', '1')
        ->orderBy('id', 'DESC')->paginate(500);//->get();
         }else if($pa=='SEN'){
         $Data = Email::select('*')->where('page','=', $pa)
        ->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='TRA'){
         $Data = Email::select('*')->where('page','=', $pa)
        ->orderBy('id', 'DESC')->paginate(500);
         }
         
         return view('admin/appemail')->with(['page'=>$pa,'Data'=>$Data]);
         }else{
         if($pa=='IN'){
         $Data = Email::select('*')->where('page','=', $pa)->where('owner','=', Auth::user()->name)
          ->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='STA'){
         $Data = Email::select('*')->where('starred','=', '1')->where('owner','=', Auth::user()->name)->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='IMP'){
         $Data = Email::select('*')->where('important','=', '1')->where('owner','=', Auth::user()->name)->orderBy('id', 'DESC')->paginate(500);//->get();
         }else if($pa=='SEN'){
         $Data = Email::select('*')->where('page','=', $pa)->where('owner','=', Auth::user()->name)->orderBy('id', 'DESC')->paginate(500);
         }else if($pa=='TRA'){
         $Data = Email::select('*')->where('page','=', $pa)->where('owner','=', Auth::user()->name)->orderBy('id', 'DESC')->paginate(500);
         }
         
         return view('admin/appemail')->with(['page'=>$pa,'Data'=>$Data]);

         }
    	
    }

    public function search_mailshowEmail(Request $request)
    {
        $search=$request->searchTKT;
        $pa=$request->hdn;

        $Data = Email::select('*')->where('ticket_number','=', $search)
        //->where('page','=', $pa)
        ->orderBy('id', 'DESC')
        ->paginate(500);
        
        if (Auth::user()->user_type == "Admin") { 
        return view('admin/appemail')->with(['page'=>$pa,'Data'=>$Data]);
         }else{
        return view('user/appemail')->with(['page'=>$pa,'Data'=>$Data]);
        }              


    }

    public function fetch_mail(Request $request){
        $id=$request->id;  
    	  $result = Email::select('*')->where('id','=', $id)
    	  ->get();
        $arr = array('result' => $result); 
        return response()->json($arr, 201);
    }
 public function appemaildetail(Request $request)
 {
         $id=$request->id;
         $page=$request->page;
         
        if($page=='IN'){
          Email::where('id','=', $id)->update(['seen'=>'1']); 

        $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();
        $output1 = Email_attachment::select('*')->where('eid','=', $id)->get();

        }elseif ($page=='SEN') {
            Email::where('id','=', $id)->update(['seen'=>'1']); 

        $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();
        $output1 = Email_attachment::select('*')->where('eid','=', $id)->get();
        }elseif ($page=='TRA') {
            Email::where('id','=', $id)->update(['seen'=>'1']); 

        $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();

        $output1 = Email_attachment::select('*')->where('eid','=', $id)->get();
        } 
        return view('/admin/appemaildetail')->with(['page'=>$page,'output'=>$output,'output1'=>$output1]);
 }

 public function get_reply(Request $request)
{
         $id=$request->id;
         $page=$request->page;

           
         Email::where('id','=', $id)->update(['seen'=>'1']); 

         $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();
        
         return view('/admin/customer_reply')->with(['page'=>$page,'output'=>$output]);
  
}

 public function get_replyall(Request $request)
    {
             $id=$request->id;
             $page=$request->page;

               
             Email::where('id','=', $id)->update(['seen'=>'1']); 

             $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();
            
             return view('/admin/customer_replyall')->with(['page'=>$page,'output'=>$output]);
    }


 public function get_Forward(Request $request)
{
         $id=$request->id;
         $page=$request->page;
           
         Email::where('id','=', $id)->update(['seen'=>'1']); 

         $output = Email::select('*')->where('id','=', $id)->orderBy('id', 'DESC')->first();
        
         return view('/admin/customer_Forward')->with(['page'=>$page,'output'=>$output]);
  
}

 public function emailsend(Request $request){
        
        $data=$request->all();
        $cust_name=explode('@',$data['email_to']);
        $cust_name=$cust_name[0];
        //print_r($data);die(); 
        
        $email = trim($request->email_to);
        
        $users_temp = explode("," ,$email);
        $email_cc=trim($request->email_cc);
        //$email_cc = explode("," ,$email_cc);
        $subject=$request->email_subject; 
        $sender_message=$request->message; 
        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        
         $data = array(
         'subject' => $subject,
         'sender_message' => $sender_message,
         'user_id' => $user_id,
         'user_name' => $user_name
         );
        
       date_default_timezone_set("Asia/Kolkata");   //India time (GMT+5:30)
       $log_time = date('Y-m-d h:i:sa');
       DB::enableQueryLog();  
        ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d H:i:s', time ());
        $updatedTime = date( 'Y-m-d H:i:s', time ());
        $dt = date('m-d-Y');
        $user_name=Auth::user()->name;
        ////////////////////////////////////////////////
         $check = Ticket::where('email_id','=', $email)
        //->Where('mobile','=', $mobile)
         //->Where('status','=', 'Open')
        ->limit(1)->get();
  
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          
          $customercheck = Customer::where('email_id','=', $email)->get();
          if(count($customercheck)==0){
          $Customer = new Customer;
          $Customer->customer_id = $customer_id;
          $Customer->owner = $user_name;
          $Customer->customer_name = $cust_name;
          $Customer->mobile = '';
          $Customer->email_id = $email;
          $Customer->save();
          }
            $Ticket = new Ticket();
            $Ticket->ticket_number = $ticno;
            $Ticket->email_id = $email;
            $Ticket->customer_id = $customer_id;
            $Ticket->customer_name = $cust_name;
            $Ticket->created_by = $user_name;
            $Ticket->created_at = $currentTime;
            $Ticket->subject = $subject;
            $Ticket->type = '';
            $Ticket->category = "Coupon Related";
            $Ticket->sub_category = "Coupon is Used";
            $Ticket->status = "New";
            $Ticket->sub_status = "New";
            $Ticket->source = "Email";
            $Ticket->source_value = "Email";
            $Ticket->product = '';
            $Ticket->tat = $currentTime;
            $Ticket->voc = '';
            $Ticket->department = "Participant";
            $Ticket->owner = $user_name;
            $Ticket->send_mail = 1;
            $Ticket->remarks = $sender_message;
            $Ticket->updated_at = $updatedTime;
            $Ticket->save();             
            
            $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
            $system_remark='New ticket has been created by '.$user_name;
            $case_status='Ticket Created';

            $Logfiles = new Logfiles;
            $Logfiles->ticket_number = $ticno;
            $Logfiles->process_name = 'HISTORY';
            $Logfiles->system_remark = $system_remark;
            $Logfiles->case_status = $case_status;
            $Logfiles->feadback = $feadback;
            $Logfiles->user_id = $user_id;
            $Logfiles->user_name = $user_name;
            $Logfiles->status = "New";
            $Logfiles->sub_status = "New";
            $Logfiles->owner = $user_name;
            $Logfiles->save();

            $Email = new Email();
            $Email->ticket_number = $ticno;
            $Email->subject = $subject;
            $Email->from1 = 'support@shelladvantagerewards.in';
            $Email->to1 = $email;
            $Email->cc_address = $email_cc;
            $Email->type = 'manual';
            $Email->compose_mail = 'comp';
            $Email->references = '';
            $Email->owner = $user_name;
            $Email->message = $sender_message;
            $Email->page = "SEN";
            $Email->save();
            
             $query = DB::getQueryLog();
             $start="************** Start Log For Day : '" . $log_time . "'**********";
             $end="************** END Log For Day : '" . $log_time . "'************";
             log::channel('custom')->critical($start);
             log::channel('custom')->critical($query);
             log::channel('custom')->critical($end);
             $query = end($query);  
               $arr = array(
                    "msg" => 'Email send Successfully',
                    "response_code" => '200',
                    );
               return response()->json($arr);
    }


 public function trashupdate(Request $request)
 {
         $chk = $request->chk; 
         foreach($chk as $key => $chks)
           {
          
           $trash=Email::where('id',$chks)->update(['page'=>'TRA']);

           }
            $arr = array(
            "msg" => 'Successfully Delete',
            "response_code" => '201',
            );
            return response()->json($arr);
 }
   

public function starupdate(Request $request)
{
       $id=$request->starid;
       $starcheck=Email::where('id',$id)->get();
        foreach($starcheck as $key => $starchecks)
           {
              if($starchecks->starred=='1'){
              Email::where('id',$id)->update(['starred'=>'0']);
               $arr = array(
                "msg" => 'Successfully not starred',
                "response_code" => '201',
                ); 
              }else{
              Email::where('id',$id)->update(['starred'=>'1']);
              $arr = array(
                "msg" => 'Successfully starred',
                "response_code" => '201',
                );
              }
           }
           return response()->json($arr);

}

public function impupdate(Request $request)
{
       $id=$request->impid;
       $impcheck=Email::where('id',$id)->get();
        foreach($impcheck as $key => $impchecks)
           {
              if($impchecks->important=='1'){
              Email::where('id',$id)->update(['important'=>'0']);
               $arr = array(
                "msg" => 'Successfully not important',
                "response_code" => '201',
                ); 
              }else{
              Email::where('id',$id)->update(['important'=>'1']);
              $arr = array(
                "msg" => 'Successfully important',
                "response_code" => '201',
                );
              }
           }
           return response()->json($arr);
}

public function get_email($email_array)
    {
        $email = [];
        foreach ($email_array as $key => $value) {

            $email[] = $value->mailbox . "@" . $value->host;
        }

        $email1 = implode(",", $email);

        return $email1;
    }

public function reply_mail()
{
    //DB::table('table_field_list_old')->limit(1)->delete();die();



    $Email = Email::select('*')->where('email_send','=', 0)->where('page','=','SEN')->get();
            

            if(count($Email) > 0){
            foreach ($Email as $key => $Emails) {
                //if(empty($Emails->cc_address))
                $email=$Emails->from1;
                 $str_name = explode("<", $email);
                 $email = $str_name[0];
                
                $email = preg_replace("/[>]/", "", $str_name[1]);
                
                $subject=$Emails->subject;
                $details=$Emails->message;
                Mail::to($email)->send(new Myreply($details,$subject));
            $this->info('Every minutes has been sent successfully');

            Email::where('id',$Emails->id)->update([ 'email_send'=> 1 ]);
            }
           
         }
}    

public function post_reply(Request $request)
{
   $data=$request->all();
   //echo '<pre>';
   //print_r($data);die();
   
        date_default_timezone_set('Asia/Kolkata');// change according timezone date_default_timezone_set("Asia/Kolkata");   //India time (GMT+5:30)
       $log_time = date('Y-m-d h:i:sa');
       DB::enableQueryLog();
        
   if(!empty($data['cc_mail']))
    {
    Email::where('id','=',$data['id'])->update([ 'cc_address'=>$data['cc_mail'], 'email_send' => 0 ]);
    $getdata=Email::select('*')->where('id',$data['id'])->get();

    }else{
    Email::where('id','=',$data['id'])->update(['email_send' => 0 ]);  
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }
    //$currentTime = date( 'Y-m-d H:i:s', time ());
    //$olddatetime = date( 'Y-m-d H:i:s', time ());
    foreach ($getdata as $key => $getdatas) 
        {
        $uid= $getdatas->uid;
        $olddatetime = $getdatas->created_at;
        }
         $from=$data['form'];
         $storeto=$data['storeto'];
         $to=$data['to']; 
         $msg=$data['msg'];
         $subject=$data['subject'];
         $page=$data['page'];
         $id=$data['id'];
         $cc=$data['cc_mail'];
         $document=$request->file('file');
       
         $forword_mail= explode(',', $to);
         $cc_mail=explode(",", $cc);
    
    
  if($document!='')
  {

//echo '<pre>';
  // print_r($data);die();
      $files=array();
      $image_file=array();
       foreach ($document as $key => $value) 
       {
           $extension = $value->getClientOriginalExtension();
           $image_file[] = time().$key."." . $value->getClientOriginalExtension();
           //$file_url=public_path('/attachment').'/'.$imageName;
           $imageName=time().$key."." . $value->getClientOriginalExtension();
           $path=$value->move(public_path('/attachment'), $imageName);
           $files[]=public_path('attachment/'.$imageName);

               
       }

       $details = array(
                 'from' => $from, 
                 'to'=> $to,
                 'msg' => $msg,
                 'subject' => $subject,
                 'forword_mail' => $forword_mail,
                 'files'=> $files,
                 'cc_mail'=> $cc_mail
                );       // echo '<pre>';
                         //echo count($getdata);die();  
                           foreach ($getdata as $key => $getdatas) 
                           {
                            //Email::where('id','=',$data['id'])->update(['email_send' => 1 ]);
                              /////////////////////////////////////////
                               Email::where('id','=',$getdatas['id'])->update([ 'page'=>'IN', 'message'=>$msg, 'rid'=>$getdatas->uid, 'email_send'=>1, 'created_at' => $olddatetime ]);
                                 if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                $Email = new Email;
                                $Email->uid = $getdatas->uid;
                                $Email->rid = $getdatas->uid;
                                $Email->ticket_number = $getdatas->ticket_number;
                                $Email->subject = $subject;
                                $Email->from1 = $getdatas->from1;
                                $Email->to1 = $to;
                                $Email->cc_address = $cc;
                                $Email->date1 = $getdatas->date1;
                                $Email->message_id = $getdatas->message_id;
                                $Email->references = $references;
                                $Email->in_reply_to = $in_reply_to;
                                $Email->message = $msg;
                                $Email->size = $getdatas->size;
                                $Email->msgno = $getdatas->msgno;
                                $Email->recent = $getdatas->recent;
                                $Email->flagged = $getdatas->flagged;
                                $Email->answered = $getdatas->answered;
                                $Email->deleted = $getdatas->deleted;
                                $Email->fromaddress =$getdatas->from;
                                $Email->seen = $getdatas->seen;
                                $Email->send_type = 'reply';
                                $Email->type = 'attched';
                                $Email->draft = $getdatas->draft;
                                $Email->udate = $getdatas->udate;
                                $Email->page = 'SEN';
                                $Email->created_at = $olddatetime;
                                $Email->save();

                                $lastinsertid=$Email->id;
                                
                               if(count($image_file) > 0){
                                  foreach ($image_file as $key => $image_files) 
                                  {  
                                    //echo '<pre>';   
                                   // echo $image_files;
                                      $file_url=$image_files;
                                      $files = new Email_attachment;
                                      $files->eid = $lastinsertid;
                                      $files->uid = $uid;
                                      $files->file = $image_files;
                                      $files->file_url = $file_url;
                                      $files->save();

                                  } 
                                 }                              
                                 
                       }
                    if(empty($cc)){
                    Mail::to($forword_mail)->send(new MyTestMail($details,$subject));

                    }else{
                    Mail::to($forword_mail)->cc($cc_mail)->send(new MyTestMail($details,$subject));  
                    }
                    ///////////////////////////////////////// 

                     // $query = DB::getQueryLog();
                     // $start="************** Start Log For Day : '" . $log_time . "'**********";
                     // $end="************** END Log For Day : '" . $log_time . "'************";
                     // log::channel('reply')->critical($start);
                     // log::channel('reply')->critical($query);
                     // log::channel('reply')->critical($end);
                     //$query = end($query);  
                       // $arr = array(
                       //      "msg" => 'Email send Successfully',
                       //      "response_code" => '200',
                       //      );
                       // return response()->json($arr);

      //Mail::to($forword_mail)->send(new Myreply($details,$subject));  
    
 
        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/customer_reply/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/customer_reply/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent');
        }
  
  }else{

        $details = array(
                     'from' => $from, 
                     'to'=> $to,
                     'msg' => $msg,
                     'subject' => $subject,
                     'forword_mail' => $forword_mail,
                     'cc_mail'=> $cc_mail
                    );
      
                  
                   foreach ($getdata as $key => $getdatas) 
                           {
                            

                            //echo $id;die();
                            Email::where('id','=',$data['id'])->update([ 'page'=>'IN', 'message'=>$msg, 'uid'=>$getdatas->uid, 'rid'=>$getdatas->uid,  'email_send'=>'1', 'created_at' => $olddatetime ]);
                                 if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                

                                $Email = new Email;
                                $Email->uid = $getdatas->uid;
                                $Email->rid = $getdatas->uid;
                                $Email->ticket_number = $getdatas->ticket_number;
                                $Email->subject = $subject;
                                $Email->from1 = $getdatas->from1;
                                $Email->to1 = $to;
                                $Email->cc_address = $cc;
                                $Email->date1 = $getdatas->date1;
                                $Email->message_id = $getdatas->message_id;
                                $Email->references = $references;
                                $Email->in_reply_to = $in_reply_to;
                                $Email->message = $msg;
                                $Email->size = $getdatas->size;
                                $Email->msgno = $getdatas->msgno;
                                $Email->recent = $getdatas->recent;
                                $Email->flagged = $getdatas->flagged;
                                $Email->answered = $getdatas->answered;
                                $Email->deleted = $getdatas->deleted;
                                $Email->fromaddress =$getdatas->from;
                                $Email->seen = $getdatas->seen;
                                $Email->send_type = 'reply';
                                $Email->type = 'manual';
                                $Email->draft = $getdatas->draft;
                                $Email->udate = $getdatas->udate;
                                $Email->page = 'SEN';
                                $Email->created_at = $olddatetime;
                                $Email->save();
                               
                                //echo $references;die();
                            $check_reply=Email::select('*')->where('send_type','=','reply')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                         
                            if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                  Email::where('id','=',$value->id)->update(['page'=>'SEN', 'message'=>$msg  ]);
                                }
                            
                            }else{
                                 
                              Email::where('id','=',$id)->update(['uid'=>$getdatas->uid, 'rid'=>$getdatas->uid, 'to1'=>$to, 'message'=>$msg, 'send_type'=>'reply', 'page'=>'SEN' ]);
                               
                           }
                                 
                       }
        
                       $query = DB::getQueryLog();
                       $start="************** Start Log For Day : '" . $log_time . "'**********";
                       $end="************** END Log For Day : '" . $log_time . "'************";
                       log::channel('reply')->critical($start);
                       log::channel('reply')->critical($query);
                       log::channel('reply')->critical($end);
                       $query = end($query);
                       
        //Mail::to($forword_mail)->send(new Myreply($details,$subject));
      
        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/appemail/'.$page)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/appemail/'.$page)->with('flash_message_success','Successfully Sent');
        }
  }
   
}




public function post_forward(Request $request)
{
    $data=$request->all();
   //echo '<pre>';
  // print_r($data);die();
    date_default_timezone_set('Asia/Kolkata');// change according timezone date_default_timezone_set("Asia/Kolkata");   //India time (GMT+5:30)
       $log_time = date('Y-m-d h:i:sa');
       DB::enableQueryLog();
        
   //$getdata=Email::select('*')->where('id',$data['id'])->get();
    if(!empty($data['cc_mail']))
    {
    Email::where('id','=',$data['id'])->update([ 'cc_address'=>$data['cc_mail'], 'email_send' => 0 ]);
    $getdata=Email::select('*')->where('id',$data['id'])->get();

    }else{
    Email::where('id','=',$data['id'])->update(['email_send' => 0 ]);  
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }
    foreach ($getdata as $key => $getdatas) 
        {
        $uid= $getdatas->uid;
        $id= $getdatas->id;
        $olddatetime = $getdatas->created_at;
        }
  
   $from=$data['form'];
   $storeto=$data['storeto'];
   $to=$data['to'];
   $msg=$data['msg'];
   $subject=$data['subject'];
   $page=$data['page'];
   $id=$data['id'];
   $cc=$data['cc_mail'];
   $document=$request->file('file');
 
   //$forword_mail= $to;//explode(',', $to);
   

   //$cc_mail=$cc;//explode(",", $cc);

  $forword_mail= explode(',', $to);
  $cc_mail=explode(",", $cc);

   if($document!='')
   {

      $files=array();
      $image_file=array();
       foreach ($document as $key => $value) 
       {
           $extension = $value->getClientOriginalExtension();
           $image_file[] = time().$key."." . $value->getClientOriginalExtension();
           //$file_url=public_path('/attachment').'/'.$imageName;
           $imageName=time().$key."." . $value->getClientOriginalExtension();
           $path=$value->move(public_path('/attachment'), $imageName);
           $files[]=public_path('attachment/'.$imageName);

               
       }

       $details = array(
                 'from' => $from, 
                 'to'=> $to,
                 'msg' => $msg,
                 'subject' => $subject,
                 'forword_mail' => $forword_mail,
                 'files'=> $files,
                 'cc_mail'=> $cc_mail
                );
       
                          foreach ($getdata as $key => $getdatas) 
                           {
                               Email::where('id','=',$getdatas['id'])->update([ 'page'=>'IN', 'message'=>$msg, 'rid'=>$getdatas->uid, 'to1'=>$to,  'email_send'=>1, 'created_at' => $olddatetime ]);
                        
                               

                                $Email_send = new Email;
                                $Email_send->uid = $getdatas->uid;
                                $Email_send->subject = $subject;
                                $Email_send->ticket_number = $getdatas->ticket_number;
                                $Email_send->from1 = $getdatas->from1;
                                $Email_send->to1 = $to;
                                $Email_send->cc_address = $cc;
                                $Email_send->date1 = $getdatas->date1;
                                $Email_send->message_id = $getdatas->message_id;
                                $Email_send->message = $msg;
                                $Email_send->size = $getdatas->size;
                                $Email_send->msgno = $getdatas->msgno;
                                $Email_send->recent = $getdatas->recent;
                                $Email_send->flagged = $getdatas->flagged;
                                $Email_send->answered = $getdatas->answered;
                                $Email_send->deleted = $getdatas->deleted;
                                $Email_send->fromaddress =$getdatas->from;
                                $Email_send->seen = $getdatas->seen;
                                $Email_send->send_type = 'fwd';
                                $Email_send->type = 'attched';
                                $Email_send->draft = $getdatas->draft;
                                $Email_send->udate = $getdatas->udate;
                                $Email_send->page = 'SEN';
                                $Email_send->created_at = $olddatetime;
                                $Email_send->save();
                                

                                  $lastinsertid=$Email_send->id;
                                
                               if(count($image_file) > 0){
                                  foreach ($image_file as $key => $image_files) 
                                  {  
                                    //echo '<pre>';   
                                   // echo $image_files;
                                      $file_url=$image_files;
                                      $files = new Email_attachment;
                                      $files->eid = $lastinsertid;
                                      $files->uid = $uid;
                                      $files->file = $image_files;
                                      $files->file_url = $file_url;
                                      $files->save();

                                  } 
                                 }    
                    if(empty($cc)){
                       Mail::to($forword_mail)->send(new MyTestforword($details,$subject));

                    }else{
                       Mail::to($forword_mail)->cc($cc_mail)->send(new MyTestforword($details,$subject));  
                    }

                           
                    }
             
        //Mail::to($forword_mail)->send(new Myforword($details,$subject));
        
 
        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/customer_Forward/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/customer_Forward/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent');
        }
   }else{
     $details = array(
                     'from' => $from, 
                     'to'=> $to,
                     'msg' => $msg,
                     'subject' => $subject,
                     'forword_mail' => $forword_mail,
                     'cc_mail'=> $cc_mail
                    );
                              
                                
                    foreach ($getdata as $key => $getdatas) 
                            {
                       // echo $id;die();
                        Email::where('id','=',$data['id'])->update([ 'page'=>'SEN', 'message'=>$msg,  'rid'=>$getdatas->uid, 'to1'=>$to,  'send_type'=>'fwd','email_send'=>1  ]);
                        
                        if(empty($getdatas->references)){
                                $references='';
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to='';
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                
                                $Email_send = new Email;
                                $Email_send->uid = $getdatas->uid;
                                $Email_send->subject = $subject;
                                $Email_send->ticket_number = $getdatas->ticket_number;
                                $Email_send->from1 = $getdatas->from1;
                                $Email_send->to1 = $to;
                                $Email_send->date1 = $getdatas->date1;
                                $Email_send->message_id = $getdatas->message_id;
                                $Email_send->references = $references;
                                $Email_send->in_reply_to = $in_reply_to;
                                $Email_send->message = $msg;
                                $Email_send->size = $getdatas->size;
                                $Email_send->msgno = $getdatas->msgno;
                                $Email_send->recent = $getdatas->recent;
                                $Email_send->flagged = $getdatas->flagged;
                                $Email_send->answered = $getdatas->answered;
                                $Email_send->deleted = $getdatas->deleted;
                                $Email_send->fromaddress =$getdatas->from;
                                $Email_send->seen = $getdatas->seen;
                                $Email_send->send_type = 'fwd';
                                $Email_send->type = 'manual';
                                $Email_send->draft = $getdatas->draft;
                                $Email_send->udate = $getdatas->udate;
                                $Email_send->cc_address = $cc;
                                $Email_send->page = 'SEN';
                                $Email_send->created_at = $olddatetime;
                                $Email_send->save();


                                $check_reply=Email::select('*')->where('send_type','=','fwd')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                         //echo count($check_reply);die();
                            /*if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                  Email::where('id','=',$value->id)->update(['page'=>'SEN', 'message'=>$msg]);
                                }
                            
                            }else{
                                

                           }*/

                         }

       
                     /*$query = DB::getQueryLog();
                     $start="************** Start Log For Day : '" . $log_time . "'**********";
                     $end="************** END Log For Day : '" . $log_time . "'************";
                     log::channel('forward')->critical($start);
                     log::channel('forward')->critical($query);
                     log::channel('forward')->critical($end);
                     $query = end($query);  
                       $arr = array(
                            "msg" => 'Email send Successfully',
                            "response_code" => '200',
                            );
                       return response()->json($arr);*/

                       $query = DB::getQueryLog();
                       $start="************** Start Log For Day : '" . $log_time . "'**********";
                       $end="************** END Log For Day : '" . $log_time . "'************";
                       log::channel('forward')->critical($start);
                       log::channel('forward')->critical($query);
                       log::channel('forward')->critical($end);
                       $query = end($query);
        
       // Mail::to($to)->cc($cc)->send(new Myforword($details,$subject));

        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/customer_Forward/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/customer_Forward/'.$page.'/'.$id)->with('flash_message_success','Successfully Sent');
        } 
   }

}






public function Emailsettingshow()
{

    $process_name='email';
    
     $id=Auth::user()->id;
     $name=Auth::user()->name;
     $stmt = Tablefleldlist::select('*')->where('process_name','=',$process_name)->where('level','!=','')->orderBy('preposition', 'ASC')->get();
    
    return view('/admin/Emailsetting')->with(['stmt' => $stmt, 'process_name'=>$process_name]);
}

public function Emailsettingedit(Request $request)
{
    
    $process_name=$request->process_name;
    $fromaddress=$request->fromaddress;
    $from=$request->from;
    $reply_to=$request->reply_to;
    $reply_toaddress=$request->reply_toaddress;
    $senderaddress=$request->senderaddress;
    $sender=$request->sender;
    $from_personal=$request->from_personal;
    $from_mailbox=$request->from_mailbox;
    $from_host=$request->from_host;
    $reply_to_personal=$request->reply_to_personal;
    $reply_to_mailbox=$request->reply_to_mailbox;
    $reply_to_host=$request->reply_to_host;
    $sender_personal=$request->sender_personal;
    $sender_mailbox=$request->sender_mailbox;
    
    $emailstatus=Processemail::where('id', '=', '1')->update(['fromaddress'=>$fromaddress,'from'=>$from,'reply_toaddress'=>$reply_toaddress,'senderaddress'=>$senderaddress,'sender'=>$sender,'from_personal'=>$from_personal,'from_mailbox'=>$from_mailbox,'from_host'=>$from_host,'reply_to_personal'=>$reply_to_personal,'reply_to_mailbox'=>$reply_to_mailbox,'reply_to_host'=>$reply_to_host,'reply_to'=>$reply_to,'sender_personal'=>$sender_personal,'sender_mailbox'=>$sender_mailbox]);

     $stmt = Tablefleldlist::select('*')->where('process_name','=',$process_name)->where('level','!=','')->orderBy('preposition', 'ASC')->get();

     if($emailstatus){
      return redirect('/admin/Emailsetting')->with("msg",'Successfully updated');
         //$arr = array(
           //     "msg" => 'Successfully updated',
             //   "response_code" => '201',
               // );
      
       }else{
        return redirect('/admin/Emailsetting')->with("msg",'Successfully not updated');
         //$arr = array(
           //     "msg" => 'Successfully not updated',
             //   "response_code" => '301',
               // ); 
       }
     
  }

  public function getFiledownload($id)
  {
   
      $filedata = Email_attachment::select('*')->where('id','=',$id)->first();
      $path = public_path('attachment/'.$filedata['file_url']);
      return response()->download($path);
  }

public function getdata(Request $rt){

      $name=$rt->owner;
     
     $User= user::select('open_url')->where('username','=',$name)->where('open_condition','=','Y')->first();
     if(empty($User)){
      return  response()->json(array('Responce'=>'400'));   
     } else{
       $url=$User['open_url'];
      return  response()->json(array('Responce'=>'200','Url'=>$url));  
     } 
  }

  public function get_find_email(Request $request)
  {
      $data=$request->all();
      $data = Email::select('*')->where('id','=',$data['id'])->get();
      
      return response()->json($data);
  }

  public function get_emailforword(Request $request)
  {
      $data=$request->all();
      $data = Email::select('*')->where('id','=',$data['id'])->get();
      
      return response()->json($data);
  }
  
  public function get_reply_mail(Request $request)
  {
       $data =$request->all();
      
       $a=explode("<",$data['to_email']);
       //echo $a[1];
      // $to = preg_replace('/[>]/', '', $a[1]);
       $to =$data['to_email'];

      $replyticketid= $data['replyticketid'];//2022051320
      $findticketid=Ticket::select('*')->where('ticket_number','=',$replyticketid)->first();
      $ticketid=$findticketid['id']; 
     
    if(!empty($data['cc_mail']))
    {
    Email::where('id','=',$data['id'])->update([ 'cc_address' => $data['cc_mail'] ]);
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }else{
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }
    
   
   $from=$data['form'];
   $to=$to;
   $msg=$data['msg'];
   $subject=$data['subject_cust'];
   $page=$data['page'];
   $id=$data['id'];
   $cc_mail=$data['cc_mail'];
   $document=$request->file('file');
   $forword_mail = explode("," ,$to);
   $cc_mail=explode(",", $cc_mail);
   

  
  if($document!='')
  {

    $files=array();
       foreach ($document as $key => $value) 
       {
           $extension = $value->getClientOriginalExtension();
           $imageName = time().$key."." . $value->getClientOriginalExtension();
          
           $path=$value->move(public_path('/attachment'), $imageName);
           $files[]=public_path('attachment/'.$imageName);
       }

      $details = array(
                 'from' => $from, 
                 'to'=> $to,
                 'msg' => $msg,
                 'subject' => $subject,
                 'forword_mail' => $forword_mail,
                 'files'=> $files,
                 'cc_mail'=> $cc_mail
                );

                           foreach ($getdata as $key => $getdatas) 
                           {
                               Email::where('id','=',$data['id'])->update([ 'page'=>'SEN', 'message'=>$msg  ]);
                                if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                
                            $check_reply=Email::select('*')->where('send_type','=','reply')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                         
                            if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                  //Email::where('id','=',$value->id)->update(['page'=>'IN', 'message'=>$msg  ]);
                                    $Email = new Email;
                                    $Email->uid = $value->uid;
                                    $Email->rid = $value->uid;
                                    $Email->ticket_number = $value->ticket_number;
                                    $Email->subject = $value->subject;
                                    $Email->from1 = $value->from1;
                                    $Email->to1 = $value->to1;
                                    $Email->date1 = $value->date1;
                                    $Email->message_id = $value->message_id;
                                    $Email->references = $references;
                                    $Email->in_reply_to = $in_reply_to;
                                    $Email->message = $msg;
                                    $Email->size = $value->size;
                                    $Email->msgno = $value->msgno;
                                    $Email->recent = $value->recent;
                                    $Email->flagged = $value->flagged;
                                    $Email->answered = $value->answered;
                                    $Email->deleted = $value->deleted;
                                    $Email->fromaddress =$value->from;
                                    $Email->seen = $value->seen;
                                    $Email->send_type = 'reply';
                                    $Email->draft = $value->draft;
                                    $Email->udate = $value->udate;
                                    $Email->page = 'SEN';
                                    //$Email->cc_address = $cc_mail;
                                    $Email->save();
                                }
                            
                            }else{
                                $Email = new Email;
                                $Email->uid = $getdatas->uid;
                                $Email->rid = $getdatas->uid;
                                $Email->ticket_number = $getdatas->ticket_number;
                                $Email->subject = $getdatas->subject;
                                $Email->from1 = $getdatas->from1;
                                $Email->to1 = $getdatas->to1;
                                $Email->date1 = $getdatas->date1;
                                $Email->message_id = $getdatas->message_id;
                                $Email->references = $references;
                                $Email->in_reply_to = $in_reply_to;
                                $Email->message = $getdatas->message;
                                $Email->size = $getdatas->size;
                                $Email->msgno = $getdatas->msgno;
                                $Email->recent = $getdatas->recent;
                                $Email->flagged = $getdatas->flagged;
                                $Email->answered = $getdatas->answered;
                                $Email->deleted = $getdatas->deleted;
                                $Email->fromaddress =$getdatas->from;
                                $Email->seen = $getdatas->seen;
                                $Email->send_type = 'reply';
                                $Email->draft = $getdatas->draft;
                                $Email->udate = $getdatas->udate;
                                $Email->page = 'SEN';
                                //$Email->cc_address = $cc_mail;
                                $Email->save();

                        $uid=$getdatas->uid;
                        $getdata_attach=Email_attachment::select('*')->where('uid',$uid)->get();
                        foreach ($getdata_attach as $key => $getdata_attachs) 
                        {
                            $Email_attachment = new Email_attachment;
                            $Email_attachment->uid = $getdata_attachs->uid;
                            $Email_attachment->file = $getdata_attachs->file;
                            $Email_attachment->save();
 
                        }
                    }
                    
                        }
                           
    if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent');
        }
  
  }else{
        
        $details = array(
                     'from' => $from, 
                     'to'=> $to,
                     'msg' => $msg,
                     'subject' => $subject,
                     'forword_mail' => $forword_mail,
                     'cc_mail'=> $cc_mail
                    );
       
                  //echo '<pre>';
                  //print_r($details);die();
                   foreach ($getdata as $key => $getdatas) 
                           {
                           
                         Email::where('id','=',$data['id'])->update([ 'page'=>'SEN', 'message'=>$msg  ]);
                         
                                if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                //echo $getdatas->message_id;
                            $check_reply=Email::select('*')->where('send_type','=','reply')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                            if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                     //echo $value->id;
                                     //die();
                                  //Email::where('id','=',$value->id)->update(['page'=>'IN', 'message'=>$msg  ]);
                                    $Email = new Email;
                                    $Email->uid = $value->uid;
                                    $Email->rid = $value->uid;
                                    $Email->ticket_number = $value->ticket_number;
                                    $Email->subject = $value->subject;
                                    $Email->from1 = $value->from1;
                                    $Email->to1 = $value->to1;
                                    $Email->date1 = $value->date1;
                                    $Email->message_id = $value->message_id;
                                    $Email->references = $references;
                                    $Email->in_reply_to = $in_reply_to;
                                    $Email->message = $msg;
                                    $Email->size = $value->size;
                                    $Email->msgno = $value->msgno;
                                    $Email->recent = $value->recent;
                                    $Email->flagged = $value->flagged;
                                    $Email->answered = $value->answered;
                                    $Email->deleted = $value->deleted;
                                    $Email->fromaddress =$value->from;
                                    $Email->seen = $value->seen;
                                    $Email->send_type = 'reply';
                                    $Email->draft = $value->draft;
                                    $Email->udate = $value->udate;
                                    $Email->page = 'SEN';
                                    //$Email->cc_address = $cc_mail;
                                    $Email->save();
                                }
                            
                            }else{
                                $Email = new Email;
                                $Email->uid = $getdatas->uid;
                                $Email->rid = $getdatas->uid;
                                $Email->ticket_number = $getdatas->ticket_number;
                                $Email->subject = $getdatas->subject;
                                $Email->from1 = $getdatas->from1;
                                $Email->to1 = $getdatas->to1;
                                $Email->date1 = $getdatas->date1;
                                $Email->message_id = $getdatas->message_id;
                                $Email->references = $references;
                                $Email->in_reply_to = $in_reply_to;
                                $Email->message = $msg;
                                $Email->size = $getdatas->size;
                                $Email->msgno = $getdatas->msgno;
                                $Email->recent = $getdatas->recent;
                                $Email->flagged = $getdatas->flagged;
                                $Email->answered = $getdatas->answered;
                                $Email->deleted = $getdatas->deleted;
                                $Email->fromaddress =$getdatas->from;
                                $Email->seen = $getdatas->seen;
                                $Email->send_type = 'reply';
                                $Email->draft = $getdatas->draft;
                                $Email->udate = $getdatas->udate;
                                $Email->page = 'IN';
                                //$Email->cc_address = $cc_mail;
                                $Email->save();
                           }
                                 
                       }

        //Mail::to($forword_mail)->send(new Myreply($details,$subject));

        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent');
        }
  } 
  }

public function post_forword_mail(Request $request)
{
    $data=$request->all();
    //echo '<pre>';
    //print_r($data);die();
    
    if(!empty($data['cc_mail']))
    {
    Email::where('id','=',$data['id'])->update([ 'cc_address' => $data['cc_mail']]);
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }else{
    $getdata=Email::select('*')->where('id',$data['id'])->get();
    }
   
      $forwordticketid= $data['forwordticketid'];//2022051320
      $findticketid=Ticket::select('*')->where('ticket_number','=',$forwordticketid)->first();
      $ticketid=$findticketid['id'];
      

   $from=$data['form'];
   $to=$data['to_email'];
   $msg=$data['msg'];
   $subject=$data['subject_cust'];
   $page=$data['page'];
   $id=$data['id'];
   $cc_mail=$data['cc_mail'];

   $from=$data['form'];
   $to=$to;
   $msg=$data['msg'];
   $subject=$data['subject_cust'];
   $page=$data['page'];
   $id=$data['id'];
   $cc_mail=$data['cc_mail'];
   $document=$request->file('file');
   $forword_mail = explode("," ,$to);
   $cc_mail=explode(",", $cc_mail);
   
   if($document!='')
   {

      $files=array();
       foreach ($document as $key => $value) 
       {
           $extension = $value->getClientOriginalExtension();
             $imageName = time().$key."." . $value->getClientOriginalExtension();
          
           $path=$value->move(public_path('/attachment'), $imageName);
           $files[]=public_path('attachment/'.$imageName);
       }
      
        $details = array(
                 'from' => $from, 
                 'to'=> $to,
                 'msg' => $msg,
                 'subject' => $subject,
                 'forword_mail' => $forword_mail,
                 'files'=> $files,
                 'cc_mail'=> $cc_mail
                );
                          foreach ($getdata as $key => $getdatas) 
                           {
                               Email::where('id','=',$data['id'])->update([ 'page'=>'IN', 'message'=>$msg  ]); 
                        $check_reply=Email::select('*')->where('send_type','=','fwd')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                         //echo count($check_reply);die();
                            if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                  Email::where('id','=',$value->id)->update(['page'=>'IN', 'message'=>$msg  ]);
                                }
                            
                            }else{
                                if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }
                                $Email_send = new Email;
                                $Email_send->uid = $getdatas->uid;
                                $Email_send->subject = $getdatas->subject;
                                $Email_send->from1 = $getdatas->from1;
                                $Email_send->to1 = $getdatas->to1;
                                $Email_send->ticket_number = $getdatas->ticket_number;
                                $Email_send->date1 = $getdatas->date1;
                                $Email_send->message_id = $getdatas->message_id;
                                $Email_send->message = $msg;
                                $Email_send->size = $getdatas->size;
                                $Email_send->msgno = $getdatas->msgno;
                                $Email_send->recent = $getdatas->recent;
                                $Email_send->flagged = $getdatas->flagged;
                                $Email_send->answered = $getdatas->answered;
                                $Email_send->deleted = $getdatas->deleted;
                                $Email_send->fromaddress =$getdatas->from;
                                $Email_send->seen = $getdatas->seen;
                                $Email_send->send_type = 'fwd';
                                $Email_send->draft = $getdatas->draft;
                                $Email_send->udate = $getdatas->udate;
                                $Email_send->page = 'SEN';
                                $Email_send->save();
                                 
                        $uid=$getdatas->uid;
                        $getdata_attach=Email_attachment::select('*')->where('uid',$uid)->get();
                        foreach ($getdata_attach as $key => $getdata_attachs) 
                        {
                            $Email_attachment = new Email_attachment;
                            $Email_attachment->uid = $getdata_attachs->uid;
                            $Email_attachment->file = $getdata_attachs->file;
                            $Email_attachment->save();
 
                        }
                       }
                    }
        
        
        //Mail::to($forword_mail)->send(new Myforword($details,$subject));
        
 
        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent'); 
        }else{
        return redirect('/user/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent');
        }
   }else{
     $details = array(
                 'from' => $from, 
                 'to'=> $to,
                 'msg' => $msg,
                 'subject' => $subject,
                 'cc_mail'=> $cc_mail
                );
                    //echo '<pre>';          
                    //print_r($getdata);die();            
                    foreach ($getdata as $key => $getdatas) 
                            {

                        Email::where('id','=',$data['id'])->update([ 'page'=>'IN', 'message'=>$msg  ]); 
                        $check_reply=Email::select('*')->where('send_type','=','fwd')->where('page','=','SEN')->where('message_id','=',$getdatas->message_id)->get();
                         //echo count($check_reply);die();
                            if(count($check_reply) > 0){
                                foreach ($check_reply as $key => $value) {
                                  //Email::where('id','=',$value->id)->update(['page'=>'IN', 'message'=>$msg  ]);
                                }
                            
                            }else{
                                if(empty($getdatas->references)){
                                $references=null;
                                }else{
                                $references=$getdatas->references;
                                }
                                if(empty($getdatas->in_reply_to)){
                                $in_reply_to=null;
                                }else{
                                $in_reply_to=$getdatas->in_reply_to;
                                }                     
                                $Email_send = new Email;
                                $Email_send->uid = $getdatas->uid;
                                $Email_send->subject = $getdatas->subject;
                                $Email_send->from1 = $getdatas->from1;
                                $Email_send->to1 = $getdatas->to1;
                                $Email_send->ticket_number = $getdatas->ticket_number;
                                $Email_send->date1 = $getdatas->date1;
                                $Email_send->message_id = $getdatas->message_id;
                                $Email_send->references = $references;
                                $Email_send->in_reply_to = $in_reply_to;
                                $Email_send->message = $msg;
                                $Email_send->size = $getdatas->size;
                                $Email_send->msgno = $getdatas->msgno;
                                $Email_send->recent = $getdatas->recent;
                                $Email_send->flagged = $getdatas->flagged;
                                $Email_send->answered = $getdatas->answered;
                                $Email_send->deleted = $getdatas->deleted;
                                $Email_send->fromaddress =$getdatas->from;
                                $Email_send->seen = $getdatas->seen;
                                $Email_send->send_type = 'fwd';
                                $Email_send->draft = $getdatas->draft;
                                $Email_send->udate = $getdatas->udate;
                                $Email_send->page = 'SEN';
                                $Email_send->save();
                       
                           }

                         }  
        
        //Mail::to($forword_mail)->send(new Myforword($details,$subject));

        if(Auth::user()->user_type=='Admin')
        {
         return redirect('/admin/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent'); 
        }else{
         return redirect('/user/ManagesTicketdetails/'.$ticketid)->with('flash_message_success','Successfully Sent');
        } 
   }





}



}
