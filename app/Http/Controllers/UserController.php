<?php

namespace App\Http\Controllers;
   
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Auth;
use App\Models\User;
use App\Models\Ticket;
use App\Models\Status;
use App\Models\Categorysub;
use App\Models\Logfiles;
use App\Models\Customer;
use Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   /* public function index()
    {
        $data = User::paginate(3);
        return view('users',compact('data'));
    }*/

    public function fornt_ticket_create(Request $request)
    {
       $email_id=$request->email_id;
       $mobile=$request->mobile;
      echo $request->file('attachment');die;
       
      ////////////////////////////////////////////////
      /*  $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno='TKT'.date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');
        $user_name='Sunil_Rathore';
      //////////////////////////////////////////////// 
     $check = Ticket::where('email_id','=', $email_id)
        ->Where('mobile','=', $mobile)
        ->Where('status','=', 'Open')->limit(1)->get();
     if(count($check) > 0)
        {
            foreach($check as $checks)
            {
                  if($checks->status=='Open')
                  {
                  $arr = array('msg' => 'Thanks for contacting Ticket_number : '.$checks->ticket_number.' your ticket is already genreated in the system with a Status as #'.$request->status.'#/#'.$request->sub_status.'#. Please leave your comments', "Ticket_number" => $checks->ticket_number, "Ticket_id" => $checks->id,
                    "response_code" => '201');


        $feadback='Ticket is already generated . The Ticket number is '.$checks->ticket_number;
        $system_remark=' This Ticket has been checked by '.$user_name;
        $case_status='Ticket is Not  Created';
                  }
            }  
        }
        else
        {
           $cust=Ticket::where('email_id','=', $email_id)
           ->Where('mobile','=', $mobile)
           ->orderBy('created_date', 'DESC')->limit(1)->get();
         if(count($cust) == 0)
         {
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id='CUSID'.date('Ymd').$custmaxid;
          
          
          $Customer = new Customer;
          $Customer->customer_id = $customer_id;
          $Customer->owner = $request->owner;
          $Customer->customer_name = $request->customer_name;
          $Customer->mobile = $request->mobile;
          $Customer->email_id = $request->email_id;
          $Customer->save();

          $Ticket = new Ticket;
          $Ticket->ticket_number = $ticno;
          $Ticket->mobile = $request->mobile;
          $Ticket->email_id = $request->email_id;
          $Ticket->customer_id = $customer_id;
          $Ticket->customer_name = $request->customer_name;
          $Ticket->created_by = $user_name;
          $Ticket->created_at = $currentTime;
          $Ticket->subject = $request->subject;
          $Ticket->type = $request->type;
          $Ticket->category = $request->category;
          $Ticket->sub_category = $request->sub_category;
          $Ticket->status = $request->status;
          $Ticket->sub_status = $request->sub_status;
          $Ticket->source = $request->source;
          $Ticket->source_value = $request->source_value;
          $Ticket->product = $request->product;
          $Ticket->tat = $request->tat;
          $Ticket->voc = $request->voc;
          $Ticket->department = $request->department;
          $Ticket->owner = $request->owner;
          $Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->remarks;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
          $arr = array('msg' => 'Service Request Generated. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
        $feadback='Ticket has been created . the ticket Number is '.$ticno.'. This ';
        $system_remark=' This ticket has been created by '.$user_name;
        $case_status='Ticket Created';

        //$user_id = Auth::user()->user_id;
        //$user_name = Auth::user()->name;
        $Log = new Log;
        $Log->ticket_number = $ticno;
        $Log->process_name = 'HISTORY';
        $Log->system_remark = $system_remark;
        $Log->case_status = $case_status;
        $Log->feadback = $feadback;
        //$Log->user_id = $user_id;
        //$Log->user_name = $user_name;
        $Log->status = $request->status;
        $Log->owner = $request->owner;
        $Log->sub_status = $request->sub_status;
        $Log->save();
        }else{
          $user_name='Sunil_Rathore';  
          foreach($smtp as $smtps)
            {
              //echo $user_name;die;
            $Ticket = Ticket::find($smtps->id); 
            $Ticket->created_by = $user_name;
            $Ticket->created_at = $currentTime;

            $Ticket->subject = $request->subject;
            $Ticket->type = $request->type;
            $Ticket->category = $request->category;
            $Ticket->sub_category = $request->sub_category;
            $Ticket->status = $request->status;
            $Ticket->sub_status = $request->sub_status;
            $Ticket->source = $request->source;
            $Ticket->source_value = $request->source_value;
            $Ticket->product = $request->product;
            $Ticket->tat = $request->tat;
            $Ticket->voc = $request->voc;
            $Ticket->department = $request->department;
            $Ticket->owner = $request->owner;
            $Ticket->next_followup_date = $request->next_followup_date;
            $Ticket->remarks = $request->remarks;
            $Ticket->updated_at = $updatedTime;
            $Ticket->update();
            }  
        $arr = array("msg" => 'Update Successfully', "response_code" => '201',
            "heading" => 'Update Successfully');
           $feadback='Ticket has been Update successfully ';
           $system_remark=' This ticket has been Update by '.$user_name;
           $case_status='Ticket Update';
           //$user_id = Auth::user()->user_id;
           //$user_name = Auth::user()->name;

          foreach($smtp as $smtps_log)
            {
           $Log = Log::find($smtps_log->id);
           //$Log->ticket_number = $ticno;
           $Log->process_name = 'HISTORY';
           $Log->system_remark = $system_remark;
           $Log->case_status = $case_status;
           $Log->feadback = $feadback;
           $Log->user_id = $user_id;
           $Log->user_name = $user_name;
           $Log->status = $request->status;
           $Log->owner = $request->owner;
           $Log->sub_status = $request->sub_status;
           $Log->update();
           }
           }

        ////////////endelse////////////
        }
        echo json_encode($arr);
        
    }*/
}
