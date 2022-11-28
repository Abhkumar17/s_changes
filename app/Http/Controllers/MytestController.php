<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MytestController extends Controller
{
   public function ticketstore(Request $request)
    {
    
     $email_id=$request->email_id;
     $mobile=$request->mobile;
     $check = Ticket::where('email_id','=', $email_id)
        ->Where('mobile','=', $mobile)
        ->Where('status','=', 'Open')->limit(1)->get();
     if(sizeof($check) > 0)
        {
        foreach($check as $checks){
          if($checks->status=='Open'){
        $arr = array('msg' => 'Thanks for contacting Ticket_number : '.$checks->ticket_number.' your ticket is already genreated in the system with a Status as #'.$request->status.'#/#'.$request->sub_status.'#.  Please leave your comments', 'status' => true);
          }else{
          echo 'sunil';
          }

         }  
        }else{
        
        ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno='TKT'.date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date( 'm-d-Y');
        
        
       //////////////////////////////////////////////// 
       $user_name='Sunil_Rathore';

       $data = Customer::select('*')
       ->where('email_id', '=', $email_id)
       ->Where('mobile','=', $mobile)->limit(1)->get();
       
        if(sizeof($data) == 0)
        {
        $custmaxid = Customer::orderBy('id', 'desc')->value('id');
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
        $Ticket->customer_id = $request->customer_id;
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
        $arr = array('msg' => 'Service Request Generated. Your SR Number is #'.$ticno.'# ', 'status' => true);
        }else{
          $emailid = $request->email_id;
          $mob = $request->mobile;
          
          $dataticket = Ticket::select('*')
           ->where('email_id', '=', $emailid)
           ->Where('mobile','=', $mob)->limit(1)->get();

          foreach($dataticket as $datatickets)
          {
           
          $Ticket = new Ticket;
          $Ticket->ticket_number = $datatickets->ticket_number;
          $Ticket->mobile = $datatickets->mobile;
          $Ticket->email_id = $datatickets->email_id;
          $Ticket->customer_id = $datatickets->customer_id;
          $Ticket->customer_name = $datatickets->customer_name;
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
          $arr = array('msg' => 'Service Request Generated. Your SR Number is #'.$datatickets->ticket_number.'# ', 'status' => true);
           
          }
         } 
        
         
        
        $feadback='Ticket has been created . the ticket Number is '.$ticno.'. This';
        $system_remark=' This ticket has been created by '.$user_name;
        $case_status='Ticket Created';
        $user_id = Auth::user()->id;;
        $user_name = Auth::user()->name;
        $Log = new Log;
        $Log->ticket_number = $ticno;
        $Log->process_name = 'HISTORY';
        $Log->system_remark = $system_remark;
        $Log->case_status = $case_status;
        $Log->feadback = $feadback;
        $Log->user_id = $user_id;
        $Log->user_name = $user_name;
        $Log->status = $request->status;
        $Log->owner = $request->owner;
        $Log->sub_status = $request->sub_status;
        $Log->save();

        }
        
        
        return response()->json($arr, 201);  
       

   
        ////////////////////////////////////////////////////////////////
        /*
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date( 'm-d-Y');
        $year=date('Y');
        $month=date('m');
        $day=date('d');
        $ticno='TKT'.$year.''.$month.''.$day.''.$maxValue;
     
        ///////////////////////////////////////////////////////////////
        $check = Ticket::where('Email_ID', $request->Email_ID)
        ->orWhere('Mobile', $request->Mobile)->get();
        
       
        if(sizeof($check) > '0')
        {
        $Ticket = new Ticket;
        $Ticket->ticket_number = $ticno;
        $Ticket->mobile = $request->Mobile;
        $Ticket->email_id = $request->Email_ID;
        $Ticket->customer_id = $request->customer_id;
        $Ticket->customer_name = $request->Customer_Name;
        $Ticket->created_by = 'Sunil_Rathore';
        $Ticket->created_at = $currentTime;
        $Ticket->subject = $request->Subject;
        $Ticket->type = $request->type;
        $Ticket->category = $request->categories;
        $Ticket->sub_category = $request->subcategories;
        $Ticket->status = $request->status;
        $showstatus=$request->status;
        $Ticket->sub_status = $request->Sub_Status;

        $showSub_Status=$request->Sub_Status;
        
        $Ticket->source = $request->Source;
        $Ticket->source_Value = $request->Source_Value;
        $Ticket->product = $request->product;
        $Ticket->tat = $request->TAT;
        $Ticket->voc = $request->VOC;
        $Ticket->department = $request->department;
        $Ticket->owner = $request->owner;
        $Ticket->next_followup_date	 = $request->next_followup_date;
        $Ticket->remarks = $request->remarks;
        $Ticket->updated_at = $updatedTime;


        $Ticket->save();
        
        return redirect('/admin/addticket')->with('flash_message_success', 'Thanks for contacting Ticket_number : '.$ticno.' your ticket is already genreated in the system with a Status as #'.$showstatus.'#/#'.$showSub_Status.'#.  Please leave your ');
    }else{
        $Ticket = new Ticket;
        $Ticket->ticket_number = $ticno;
        $Ticket->mobile = $request->Mobile;
        $Ticket->email_id = $request->Email_ID;
        $Ticket->customer_id = $request->customer_id;
        $Ticket->customer_name = $request->Customer_Name;
        $Ticket->created_by = 'Sunil_Rathore';
        $Ticket->created_at = $currentTime;
        $Ticket->subject = $request->Subject;
        $Ticket->type = $request->type;
        $Ticket->category = $request->categories;
        $Ticket->sub_category = $request->subcategories;
        $Ticket->status = $request->status;
        $showstatus=$request->status;
        $Ticket->sub_status = $request->Sub_Status;

        $showSub_Status=$request->Sub_Status;
        
        $Ticket->source = $request->Source;
        $Ticket->source_Value = $request->Source_Value;
        $Ticket->product = $request->product;
        $Ticket->tat = $request->TAT;
        $Ticket->voc = $request->VOC;
        $Ticket->department = $request->department;
        $Ticket->owner = $request->owner;
        $Ticket->next_followup_date	 = $request->next_followup_date;
        $Ticket->remarks = $request->remarks;
        $Ticket->updated_at = $updatedTime;


        $Ticket->save();
        
        return redirect('/admin/addticket')->with('flash_message_success', 'Thanks for contacting Ticket_number : '.$ticno.' your ticket is already genreated in the system with a Status as #'.$showstatus.'#/#'.$showSub_Status.'#.  Please leave your ');

     }*/
     //$arr = array('msg' => 'Successfully Form Submit', 'status' => true);
     //$arr = array('msg' => 'Something goes to wrong. Please try again later', 'status' =>false);
     } 
}
