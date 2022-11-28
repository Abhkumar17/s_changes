<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Mail;
use Auth;
use Session;
use App\Models\User;
use App\Models\Ticket;
use App\Models\Status;
use App\Models\Categorysub;
use App\Models\Logfiles;
use App\Models\Customer;
use App\Models\Document;
use App\Models\subcategory;
use App\Models\Product;
use Validator;
use App\Mail\CustomerMail;

//use Illuminate\Support\Facades\Hash;
//use Laravel\Passport\HasApiTokens;


class ApiController extends Controller
{

    public function login(Request $request) {
         //echo 'sunil';die();
        $validator = Validator::make($request->all(), [ 
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);
        }
      
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password, 'status' => '1'])){ 
            
             
            //$dd=$request->session()->put('datas', $request->input());
             $token = auth()->user()->createApiToken(); #Generate token
             //print_r($dd);die(); 
             $user=user::select('*')->where('email','=',$request->email)->update([ 'api_token'=>$token,  ]);
           
            return response()->json(['status' => 'Authorised', 'token' => $token, 'id'=>Auth::user()->id ], 200);
          }else { 
            return response()->json(['status'=>'Unauthorised', 'id'=>Auth::user()->id], 401);
        } 
    }

	 public function status(Request $request)
     {
       $data=$request->all();
       print_r($data);die(); 
       $mobile=$request->mobile;
       $user=user::select('*')->where('phone_number','=',$mobile)->get();
      
       //echo auth()->user()->createApiToken();die();

       foreach ($user as $key => $value) {
           
          echo $tohan=$value->api_token;
     
         } 
  die();
        $check = Ticket::Where('mobile','=', $mobile)->get();
        $token = auth()->user()->createApiToken(); #Generate token
        if(count($check) > 0){


            foreach ($check as $key => $checks) {
                $status=$checks->status;
                if($status =='Closed')
                {

                     return response()->json(['status' => $status,'ticket_number' => $checks->ticket_number, 'token' => $token], 200);
              
                }else if($status =='New' || $status =='Open' || $status =='Working'){
                     return response()->json(['status' => 'New Ticket Ctreated', 'token' => $token], 200);      
                }
            }
        
        }

       
     
   }


   public function new_ticket(Request $request)
   {
       echo 'xyz';die();
       $mobile=$request->mobile;
       //$token = auth()->user()->createApiToken(); #Generate token
      ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id');
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  

        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');
        //$user_name=Auth::user()->name;
       
       //////////////////////////////////////////////// 
          
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          
         $customercheck = Customer::where('mobile','=', $mobile)->get();
          if(count($customercheck)==0){
          $Customer = new Customer;
          $Customer->customer_id = $customer_id;
          $Customer->owner = $request->owner;
          $Customer->customer_name = $request->customer_name;
          $Customer->mobile = $request->mobile;
          $Customer->email_id = $request->email_id;
          $Customer->save();
          }

          $Ticket = new Ticket;
          $Ticket->ticket_number = $ticno;
          $Ticket->mobile = $request->mobile;
          $Ticket->email_id = 'sunil@vert-age.com';
          $Ticket->customer_id = $customer_id;
          $Ticket->customer_name = '';
          $Ticket->created_by = 'Admin';
          $Ticket->created_at = $currentTime;
          $Ticket->subject = $request->subject;
          $Ticket->type = 'complain';
          $Ticket->category = 'CRM';
          $Ticket->sub_category = $request->sub_category;
          $Ticket->status = 'New';
          $Ticket->sub_status = 'New';
          $Ticket->source = 'Other Platform';
          $Ticket->source_value = 'Other Platform';
          $Ticket->product = $request->product;
          $Ticket->tat = date('Y-m-d');
          $Ticket->voc = $request->voc;
          $Ticket->department = 'Support';
          $Ticket->owner = 'Deepak Swami';
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = '';
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
         


          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark='New ticket has been created by Admin';
          $case_status='Ticket Created';

            //$user_id = Auth::user()->user_id;
            //$user_name = Auth::user()->name;
            $Logfiles = new Logfiles;
            $Logfiles->ticket_number = $ticno;
            $Logfiles->process_name = 'HISTORY';
            $Logfiles->system_remark = $system_remark;
            $Logfiles->case_status = $case_status;
            $Logfiles->feadback = $feadback;
            //$Logfiles->user_id = $user_id;
            //$Logfiles->user_name = $user_name;
            $Logfiles->status = $request->status;
            $Logfiles->owner = $request->owner;
            $Logfiles->sub_status = $request->sub_status;
            $Logfiles->save();
        

        $data = array(
         'ticno'=> $ticno,
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         //'user_name' => $user_name,
         'status' => 'New'
       );
        
        $emails = array("manikant.verma@vert-age.com");
        
            //Mail::to($email_id)->send(new CustomerMail($data));

         $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', 'token' => $token);    
         //foreach ($emails as $key => $value) 
        /// {
            //Mail::to($emails)->send(new CustomerMail($data));
        // } 
         if($Log){
            return response()->json($arr);
          }else{
            return response()->json(['status'=>'Service Request not Generated Successfully', 'token' => $token], 401);
          }
          
       
       
   }
}
