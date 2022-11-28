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


class AddController extends Controller
{
   public function all_data_get_find(){
    $user_name = Input::get('colume_name_st');
    $department_name = Input::get('colume_name_mt');
    $colume_value = Input::get('colume_value'); //department search
    $user = Input::get('Process_name');
    $Ticket = Input::get('Process');
    //echo $colume_value;
    $html = '';
    $html='<div class="row" style="padding:15px;">';
    $html.='<table class="table table-bordered no-wrap owner_table">';
    $html.='<tr class="label-success">';
    $html.='<td>Name</td><td>Dept</td><td>Open Cases</td> <td>Specility</td>';
    $html.='</tr>';
    //$smtp = Categorysub::select('category_name')->distinct()->get();
    $smtp=User::select('name')->where('department_name', '=', $colume_value)
    ->where('department_name', '!=', '')->get();
    //print_r($smtp);die;

     foreach ($smtp as $smtps) 
     {
     $owner=$smtps->owner;
     $smtp1 = Ticket::select('owner')->where('owner', '=', $owner)
      ->where('status', '=', 'Open')->get();

    $html.='<tr data='.$owner.' onclick=owner_name(this)>';
    $html.='<td>'.$owner.'</td><td>'.$colume_value.'</td><td>6</td> <td>Specility</td>';
    $html.='</tr>';
    
     }
      $html.='</table>';
      $html.= '</div>';
      echo $html; 

  }

  public function showwelcome()
  {
   return view('/customer'); 
  }

  public function show_about()
  {
    return view('/about');
  }

  public function show_service()
  {
  	return view('/service');
  }
  public function show_contact()
  {
  	return view('/contact');
  }

   public function total_ticket()
    {
    
        $ticket = Ticket::select('*')->get();
         //echo $total_ticket=count($ticket);die;
        return view('/admin/dashboard')->with('ticket',$ticket);
    }

  public function showcategory()
    {
    
        $cate = Categorysub::select('category_name')->distinct()->get();
       
        return view('/admin/addticket')->with('cate',$cate);
    }

    public function subcategories(Request $request)
    {
      $category_name =$request->input('category_name');
      $subcategories = subcategory::select('sub_category')->where('cateid', '=', $category_name)
       ->get();
      return json_encode($subcategories);
    }

   public function substatus(Request $request)
    {
      $status =$request->input('status');
      $Process =$request->input('Process');

      //$status = Input::get('status');
      //$Process = Input::get('Process');
      $subcategories = Status::select('sub_status')->where('status', '=', $status)
      ->where('Process_name', '=', $Process)
      ->where('sub_status', '!=', '')->get();
      return json_encode($subcategories);
    }

    public function getUserData(Request $request){

      $html='';
      
      //echo $department =$request->input('department') .'|'.Auth::user()->id .'|'. Auth::user()->user_type;die(); 
      $department =$request->input('department');
      if(Auth::user()->user_type=='Admin'){
      $smtp = User::select('*')
      ->where('department_name', '=', $department)
      ->where('id', '!=', Auth::user()->id)
      ->where('type', '=', 'Special')
      //->where('user_type', '=', 'User') 
      ->get();
    }else{
      $smtp = User::select('*')
      ->where('department_name', '=', $department)
      //->where('id', '!=', Auth::user()->id)
      ->where('type', '=', 'Special')
      //->where('user_type', '=', Auth::user()->user_type) 
      ->get();
    }
    //echo $smtp;die();
 
    $html.='<table id="hide" style="position: absolute; z-index: 9999999999999999999999999999; top:58px;background-color: #fff;"  class="table table-bordered table-sm"><tr style=background:blue;color:white;><td>Name</td><td>Dept</td><td>Open Cases</td><td>Specility</td></tr>';
    foreach ($smtp as $smtps) 
     {
     $name=$smtps->name;
     $smtp1 = Ticket::select('*')->where('owner', '=', $name)
     ->where('status', '=', 'Open')->get();

$html.='<tbody id="bodyData"><tr data='.$smtps->name.'  onclick=owner_name(this)>'.

                    '<td>'.$smtps->name.'</td>'.

                    '<td>'.$department.'</td>'.

                    '<td>'.count($smtp1).'</td>'.

                    '<td>Specility</td>'.

                '</tr></tbody>';

    }
    $html.='</table>';
      //return json_encode($html);
      return Response($html);
    }
   

    public function custfetch(Request $request){
         if($request->ajax()) {
          //$query=$request->query;
          $query=$request->get('query');
          
          $data = Customer::select('customer_name','mobile','email_id','customer_id')
          ->where('customer_name', 'LIKE', '%'.$query.'%')
          ->orwhere('mobile', 'LIKE', '%'.$query.'%')
          ->orwhere('email_id', 'LIKE', '%'.$query.'%')
          ->where('customer_name', '!=', '')->get(); 
           //print_r($data);die(); 
            $output = '';
           
          if (count($data)>0) {
            
           $output = '<ul class="list-group" id="searchResult" style="display: block; position: relative; z-index: 1;height: 200px;
    overflow: scroll;margin-top: -15px;">';
              
                foreach ($data as $row)
                {
                 
                $output .= '<li class="list-group-item" data-customer="'.$row->customer_name.'" data-phone="'.$row->mobile.'" data-email="'.$row->email_id.'"><svg width="40" height="40"><circle cx="20" cy="20" r="15" fill="#021531"></circle><text x="50%" y="54%" text-anchor="middle" fill="white" font-size="16px" font-family="Arial" dy=".3em">'.ucfirst($row->customer_name[0]).'</text></svg>'. $row->customer_name .'</li>';
                  //$output .= '<label style="height: auto;">'.$row->email_id.'</label>';  
                }
                
              
                $output .= '</ul>';

                
            }
            /*else {
             
                $output .= '<li class="list-group-item">'.'No results'.'</li>';
            }*/
           
            return $output;
        }

        }
    public function getDetails(Request $request)
      {
          $id=$request->get('id');
      $data = Ticket::select('customer_name','mobile','email_id','customer_id')->where('customer_name', 'LIKE', ''.$id.'%')->get();
      
          echo json_encode($data);
          //exit;
      }    
    public function prodfetch(Request $request){
         if($request->ajax()) {
          
          $search=$request->get('search');
          
          $data = Product::select('product')->where('product', 'LIKE', '%'.$search.'%')
          ->where('product', '!=', '')->limit(5)->get(); 
          
          $search_arr = array();
           
          if (count($data)>0) {
              
                foreach ($data as $row)
                {
                 $product = $row->product;
                 $search_arr[] = array("product" => $product);
                }
            
             echo json_encode($search_arr); 
        }
     }
         
  }
    
    public function ticketstore(Request $request)
    {
        /*echo $token = $user->createToken('API Token')->accessToken;
        echo 'xyz';die();*/
        $email_id=$request->email_id;
        $mobile=$request->mobile;
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
        $check = Ticket::where('email_id','=', $email_id)
        ->Where('mobile','=', $mobile)
        ->Where('status','=', 'Open')->limit(1)->get();
  
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          
         $customercheck = Customer::where('email_id','=', $email_id)->get();
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
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->remarks;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
         


          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark=' New ticket has been created by '.$user_name;
          $case_status='Ticket Created';

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $ticno;
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $request->status;
        $Logfiles->owner = $request->owner;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->save();
        

        $data = array(
         'ticno'=> $ticno,
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'user_name' => $user_name,
         'status' => 'Open'
       );
        
        //$emails = array("manikant.verma@vert-age.com");
        
            //Mail::to($email_id)->send(new CustomerMail($data));

         $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');    
         //foreach ($emails as $key => $value) 
        /// {
            ///////////Mail::to($emails)->send(new CustomerMail($data));
        // } 
       
        return response()->json($arr, 200);  
        
      }
   
     


   public function myform()
    {
      return view('admin.my-form');
    }
   
   public function myformPost(Request $request)
    {
     $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'address' => 'required',
        ]);


    if($validator->passes()) 
    {
      return response()->json(['success'=>'Added new records.']);
    }
      return response()->json(['error'=>$validator->errors()->all()]);
    }

public function getticketsatats(Request $request)
{
      $Ticket_number=$request->Ticket_number;
      $action=$request->action;
      if($action=='Ticket_status'){
      $smtp =Ticket::where('ticket_number',$Ticket_number)
    ->orderBy('created_date','DESC')
    ->get();
    if(count($smtp)>0)
    {
      foreach ($smtp as $smtps) 
           {
            $result = array(
                    "msg" => 'The Ticket Status of the Ticket Number #'.$smtps->ticket_number.'# is  #'.$smtps->status.'#/#'.$smtps->sub_status.'#',
                    "response_code" => '201'
                ); 
        }
    }else{
    $result = array(
            "msg" => 'Invalid Ticket No.'.$Ticket_number,
            "response_code" => '201'
        );

    }
    echo json_encode($result);
  }
}


public function fornt_ticket_create(Request $request)
{
    
        $email_id=$request->email_id;
        $mobile=$request->mobile;
      ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');
        $user_name='customer';
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


        $feadback='The Ticket number is '.$checks->ticket_number;
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
          $customer_id=date('Ymd').$custmaxid;
          
          
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
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->remarks;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
          $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark=' New ticket has been created by '.$user_name;
          $case_status='Ticket Created';

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $ticno;
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $request->status;
        $Logfiles->owner = $request->owner;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->save();

        $ext=$files->getClientOriginalExtension();
        $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
        $path=$files->move(public_path('/document'), $imageName);
        $file_size = $path->getSize();
        $file_size = number_format($file_size / 1048576,2).' MB';
        $document_id='DOC'.date('Ymdhis').rand(000,999);
        $Process_name='Ticket';
      
        $Document = new Document;
        $Document->document_id = $document_id;
        $Document->document_type = $ext;
        $Document->document_name = $imageName;
        $Document->document_size = $file_size;
        $Document->ticket_number = $feadback;
        $Document->process_name = $ticno;
        $Document->customer_id = $customer_id;
        $Document->save(); 

        }else{
          $user_name='customer';  
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
            //$Ticket->next_followup_date = $request->next_followup_date;
            $Ticket->remarks = $request->remarks;
            $Ticket->document_id =$document_id;
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
           $Logfiles = Logfiles::find($smtps_log->id);
           //$Log->ticket_number = $ticno;
           $Logfiles->process_name = 'HISTORY';
           $Logfiles->system_remark = $system_remark;
           $Logfiles->case_status = $case_status;
           $Logfiles->feadback = $feadback;
           //$Logfiles->user_id = $user_id;
           //$Logfiles->user_name = $user_name;
           $Logfiles->status = $request->status;
           $Logfiles->owner = $request->owner;
           $Logfiles->sub_status = $request->sub_status;
           $Logfiles->update();
           }
           }

        ////////////endelse////////////
        }
       echo json_encode($arr);
    
}


public function file_upload(Request $request)
{    

        if($files = $request->file('attachment'))
          {
        $email_id=$request->email_id;
        $mobile=$request->mobile;
        ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');

        $User=User::select('id','name','department_name')
        ->where('type','=','Special')
        ->where('department_name','=',$request->department)
        ->first();
          
        $user_name=$User['name'];
        //////////////////////////////////////////////// 
        $check = Ticket::where('email_id','=', $email_id)
        ->Where('mobile','=', $mobile)
        ->Where('status','=', 'Open')->limit(1)->get();
      
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          $customercheck = Customer::where('email_id','=', $email_id)->get();
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
          $Ticket->email_id = $request->email_id;
          $Ticket->customer_id = $customer_id;
          $Ticket->customer_name = $request->customer_name;
          $Ticket->created_by = 'customer';
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
          $Ticket->owner = $user_name;
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->subject;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
          $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark=' New ticket has been created by '.$request->customer_name;
          $case_status='Ticket Created';

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $ticno;
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $request->status;
        $Logfiles->owner = $user_name;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->save();

        $ext=$files->getClientOriginalExtension();
        $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
        $path=$files->move(public_path('/document'), $imageName);
        $file_size = $path->getSize();
        $file_size = number_format($file_size / 1048576,2).' MB';
        $document_id='DOC'.date('Ymdhis').rand(000,999);
        $Process_name='Ticket';
      
        $Document = new Document;
        $Document->document_id = $document_id;
        $Document->document_type = $ext;
        $Document->document_name = $imageName;
        $Document->document_size = $file_size;
        $Document->ticket_number = $ticno;
        $Document->process_name = 'Ticket';
        $Document->customer_id = $customer_id;
        $Document->save();
        $subject = 'Shell Advantage Support Ticket #'.$ticno.'#';
        $data = array(
         'ticno'=> $ticno,
         'subject' => 'Shell Advantage Support Ticket #'.$ticno.'#',
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'user_name' => $user_name,
         'status' => 'Open'
         );

         $emails = array("manikant.verma@vert-age.com");
        
            Mail::to($email_id)->send(new CustomerMail($data));

         $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201'); 
            //Mail::to($emails)->send(new CustomerMail($data)); 
        echo json_encode($arr);
          
        }else{
        
        $email_id=$request->email_id;
        $mobile=$request->mobile;
        ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');

        $User=User::select('id','name','department_name')
        ->where('type','=','Special')
        ->where('department_name','=',$request->department)
        ->first();
          
        $user_name=$User['name'];
        //////////////////////////////////////////////// 
        $check = Ticket::where('email_id','=', $email_id)
        ->Where('mobile','=', $mobile)
        ->Where('status','=', 'Open')->limit(1)->get();
      
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          
          $customercheck = Customer::where('email_id','=', $email_id)->get();
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
          $Ticket->email_id = $request->email_id;
          $Ticket->customer_id = $customer_id;
          $Ticket->customer_name = $request->customer_name;
          $Ticket->created_by = 'customer';
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
          $Ticket->owner = $user_name;
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->subject;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();
          $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark=' New ticket has been created by '.$request->customer_name;
          $case_status='Ticket Created';

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $ticno;
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $request->status;
        $Logfiles->owner = $user_name;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->save();
        $subject = 'Shell Advantage Support Ticket #'.$ticno.'#';
         $data = array(
         'ticno'=> $ticno,
         'subject' => 'Shell Advantage Support Ticket #'.$ticno.'#',
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'user_name' => $user_name,
         'status' => 'Open'
         );
          $emails = array("manikant.verma@vert-age.com");
        
            Mail::to($email_id)->send(new CustomerMail($data));

         $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201'); 
            //Mail::to($emails)->send(new CustomerMail($data));
        
            echo json_encode($arr);
          } 

         
     /* if($files = $request->file('attachment'))
      {
        $email_id=$request->email_id;
        $mobile=$request->mobile;
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');
        $user_name='customer';
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


        $feadback='The Ticket number is '.$checks->ticket_number;
        $system_remark=' This Ticket has been genreated by '.$request->customer_name;
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
          $ext=$files->getClientOriginalExtension();
           $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
          
          $path=$files->move(public_path('/document'), $imageName);
          $file_size = $path->getSize();
          $file_size = number_format($file_size / 1048576,2).' MB';
          $document_id='DOC'.date('Ymdhis').rand(000,999);
          $process_name='Ticket';
          
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $customer_id=date('Ymd').$custmaxid;
          
          
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
          $Ticket->major_issue = $request->major_issue;
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
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->remarks;
          $Ticket->document_id =$document_id;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();


          

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

        $Document = new Document;
        $Document->document_id = $document_id;
        $Document->document_type = $ext;
        $Document->document_name = $imageName;
        $Document->document_size = $file_size;
        $Document->ticket_number = $ticno;
        $Document->process_name = $process_name;
        $Document->customer_id = $customer_id;
        $Document->save();
        
        $data = array(
         'ticno'=> $ticno,
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'user_name' => $user_name,
         'status' => 'Open'
       );
        
        //$emails = array("rathore.sunil23@gmail.com", "rathore.sunil11@gmail.com");
        //print_r($emails);
        //die();
       
         if(Mail::failures())
            {
              $arr = array(
                    "msg" => 'Email not send some error',
                    "response_code" => '301',
                    );
               //return response()->json($arr);
            
             }else{

              //Mail::to($request->email_id)->send(new CustomerMail($data));
       
              //Mail::to($emails)->send(new CustomerMail($data));

             $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
          $feadback='Ticket has been created . the ticket Number is '.$ticno.'.';
          $system_remark=' New ticket has been created by '.$request->customer_name;
          $case_status='Ticket Created';
            
             }
        

        }else{
          $user_name=$request->customer_name;  
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
            //$Ticket->next_followup_date = $request->next_followup_date;
            $Ticket->remarks = $request->remarks;
            $Ticket->document_id =$document_id;
            $Ticket->updated_at = $updatedTime;
            $Ticket->update();
            }  
        $arr = array("msg" => 'Update Successfully', "response_code" => '201',
            "heading" => 'Update Successfully');
           $feadback='Ticket has been Update successfully ';
           $system_remark='This ticket has been Update by '.$request->customer_name;
           
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
           //$Log->user_id = $user_id;
           //$Log->user_name = $user_name;
           $Log->status = $request->status;
           $Log->owner = $request->owner;
           $Log->sub_status = $request->sub_status;
           $Log->update();
           }
           }
         }  
        echo json_encode($arr);

      
      }else{
        $email_id=$request->email_id;
        $mobile=$request->mobile;
      ////////////////////////////////////////////////
        $maxValue = Ticket::orderBy('id', 'desc')->value('id'); 
        $maxValue=$maxValue + 1;
        $ticno=date('Ymd').$maxValue;  
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date( 'Y-m-d h:i:s', time ());
        $dt = date('m-d-Y');
        $user_name='customer';
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


        $feadback='The Ticket number is '.$checks->ticket_number;
        $system_remark='This Ticket has been genreated by '.$request->customer_name;
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
          $customer_id=date('Ymd').$custmaxid;
          
          
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
          $Ticket->major_issue = $request->major_issue;
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
          //$Ticket->next_followup_date = $request->next_followup_date;
          $Ticket->remarks = $request->remarks;
          $Ticket->updated_at = $updatedTime;
          $Ticket->save();

        $feadback='The Ticket number is '.$ticno;
        $system_remark='This Ticket has been genreated by '.$request->customer_name;

        $case_status='Ticket is Not  Created';
        

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
        
          $data = array(
         'ticno'=> $ticno,
         'customer_name' => $request->customer_name,
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'user_name' => $user_name,
         'status' => 'Open'
         );
         // print_r($data);die();


        $emails = array("rathore.sunil23@gmail.com", "rathore.sunil11@gmail.com");
        //print_r($emails);
        //die();
       
         if(Mail::failures())
            {
              $arr = array(
                    "msg" => 'Email not send some error',
                    "response_code" => '301',
                    );
               //return response()->json($arr);
            
             }else{

              //Mail::to($request->email_id)->send(new CustomerMail($data));
       
              //Mail::to($emails)->send(new CustomerMail($data));

              $arr = array('msg' => 'Service Request Generated Successfully. Your SR Number is #'.$ticno.'# ', "response_code" => '201');
        $feadback='Ticket has been created . the ticket Number is '.$ticno.'. This ';
        $system_remark='New ticket has been created by '.$request->customer_name;
        $case_status='Ticket Created';

             }


        }else{
          $user_name=$request->customer_name;  
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
            //$Ticket->next_followup_date = $request->next_followup_date;
            $Ticket->remarks = $request->remarks;
            $Ticket->updated_at = $updatedTime;
            $Ticket->update();
            }  
        $arr = array("msg" => 'Update Successfully', "response_code" => '201',
            "heading" => 'Update Successfully');
           $feadback='Ticket has been Update successfully ';
           $system_remark='This ticket has been Update by '.$request->customer_name;
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
           //$Log->user_id = $user_id;
           //$Log->user_name = $user_name;
           $Log->status = $request->status;
           $Log->owner = $request->owner;
           $Log->sub_status = $request->sub_status;
           $Log->update();
           }
           }

        ////////////endelse////////////
        }*/
       // echo json_encode($arr);
        

     // }
  }
public function ratefeed()
{
  return view('feedback');
}


}
