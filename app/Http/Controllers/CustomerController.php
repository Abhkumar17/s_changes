<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
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
use App\Models\Customer;
use App\Models\Task;
use App\Models\{Country,State,City};
use App\Mail\Forgotpassword;
use App\Models\Email;

class CustomerController extends Controller
{
    public function customerlistview()
    {
        //echo Auth::user()->name;die();
      return view('/admin/customerlistview');
    }

    public function getcustomerlist()
    {

    	$usersQuery = Customer::query();
        
        $ticket_search = (!empty($_GET["ticket_search"])) ? ($_GET["ticket_search"]) : ('');         
        $status_tb = (!empty($_GET["status_tb"])) ? ($_GET["status_tb"]) : ('');
        $Source_tb = (!empty($_GET["Source_tb"])) ? ($_GET["Source_tb"]) : ('');
        $user_name = (!empty($_GET["user_name_tb"])) ? ($_GET["user_name_tb"]) : ('');
        $department = (!empty($_GET["department_tb"])) ? ($_GET["department_tb"]) : ('');
        $category_name = (!empty($_GET["category_name_tb"])) ? ($_GET["category_name_tb"]) : ('');
       
        if($ticket_search){
        $usersQuery->whereRaw("(process_ticket.ticket_number) = '" . $ticket_search . "' ");
        }else if($status_tb){
         $usersQuery->whereRaw("(process_ticket.status) = '" . $status_tb . "' ");
        }else if($Source_tb){
         $usersQuery->whereRaw("(process_ticket.source) = '" . $Source_tb . "' "); 
        }else if($user_name){
        $usersQuery->whereRaw("(process_ticket.owner) = '" . $user_name . "' ");
        }else if($department){
        $usersQuery->whereRaw("(process_ticket.department) = '" . $department . "' ");
        }else if($category_name){
        $usersQuery->whereRaw("(process_ticket.category) = '" . $category_name . "' ");
        }
        /*if(Auth::user()->user_type=='Admin'){
        $users = $usersQuery->select('id','customer_id','email_id','mobile','customer_name','owner')->orderBy('id', 'DESC');
        }elseif(Auth::user()->type == 'Special'){
        $users = $usersQuery->select('id','customer_id','email_id','mobile','customer_name','owner')->orderBy('id', 'DESC');
        }else{*/
        $users = $usersQuery->select('id','customer_id','email_id','mobile','customer_name','owner')->orderBy('id', 'DESC');      
        //}
        return datatables()->of($users) 
             ->addColumn('checkbox', function($data) {
                 
                      /*return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';*/
                 
              })

            ->addColumn('action', function($users){
                 if(Auth::user()->user_type=='Admin')
                  { 
                $viewUrl = url('/admin/Managescustomerdetails/'.$users->customer_id);
                }else{
                $viewUrl = url('/user/Managescustomerdetails/'.$users->customer_id);
                }

               //$viewUrl = url('/admin/ManagesTicketdetails/'.$users->id);
                   $btn = '<a href="'.$viewUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View"></i> </a>';
                   return $btn;
            })
            ->rawColumns(['checkbox','action']) 
            ->make(true);

    }

public function tasklistview()
  {
      return view('/admin/task');
  }

public function gettasklist()
{

    
    $usersQuery = Task::query();
        
        if(Auth::user()->user_type=='Admin'){
        $users = $usersQuery->select('id','ticket_id','ticket_number','addtaskdetail','owner','status','work_status','created_at')->orderBy('id', 'DESC');
        }elseif(Auth::user()->type == 'Special'){
        $users = $usersQuery->select('id','ticket_id','ticket_number','addtaskdetail','owner','status','work_status','created_at')->orderBy('id', 'DESC');
        }else{
        $users = $usersQuery->select('id','ticket_id','ticket_number','addtaskdetail','owner','status','work_status','created_at')->where('owner',Auth::user()->name)->orderBy('id', 'DESC');
        //->where('owner',Auth::user()->name)->orderBy('id', 'DESC');    
        }
        
        return datatables()->of($users)
             
             ->addColumn('checkbox', function($data) {
                 
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';
                //echo $users->ticket_number;
              })
             ->addColumn('action', function($users){
              //$findticket = Ticket::where('ticket_number', $users->ticket_number)->first(); 
                 if(Auth::user()->user_type=='Admin')
                    { 
                    $viewUrl = url('/admin/ManagesTicketdetails/'.$users->ticket_id);
                    }else{
                    $viewUrl = url('/user/ManagesTicketdetails/'.$users->ticket_id);
                    }

               
                   $btn = '<a href="'.$viewUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View"></i> </a>';
                   return $btn;
            })
            ->addColumn('work_status', function($users){
                 if($users->work_status == 1)
                  { 
                    $btn = '<a href="#" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm" style="padding: 0px 10px 0px 10px;background-color: green;border: none;">Yes</a>';
                    }else{
                    $btn = '<a href="#" data-toggle="tooltip" data-original-title="View" class="btn btn-primary btn-sm" style="padding: 0px 10px 0px 10px;background-color: red;border: none;">No </a>';
                    }
                    return $btn;
            })
            ->rawColumns(['checkbox','action','work_status']) 
            ->make(true);
}

    
  public function Addcust()
  {
   return view('/admin/Addcustomer'); 
  }

  public function Addcuststore(Request $request)
  {
      $data=$request->all();
      //print_r($data);die();
          $custmaxid = Ticket::orderBy('id', 'desc')->value('id');
          $custmaxid = $custmaxid + 1;
          $cust_id=date('Ymd').$custmaxid;
          
          $checkcustomer = Customer::where('email_id', $data['email_id'])->get();
               //echo count($checkcustomer);die();

                if(count($checkcustomer) > 0 )
                {
                  $arr = array('messages' => 'Already exists Email Id!', "response_code" => '201');
                }else{
                $Customer = new Customer();
                $Customer->customer_id = $cust_id;
                $Customer->owner = $data['owner'];
                $Customer->company_name = $data['customer_name'];
                $Customer->customer_name = $data['customer_name'];
                $Customer->mobile = $data['mobile'];
                $Customer->email_id = $data['email_id'];
                $Customer->fax = $data['fax'];
                $Customer->skype_Id = $data['skype_Id'];
                $Customer->country = $data['country'];
                $Customer->state = $data['state'];
                $Customer->city = $data['city'];
                $Customer->description = $data['description'];
                $Customer->save();

                    if($Customer){
                      $arr = array('messages' => 'Successfully Customer Created.', "response_code" => '201');
                      
                    }else {
                      $arr = array('messages' => 'Successfully not User Created', "response_code" => '301');
                    }    
                }
          
            return response()->json($arr, 201);
  }

   public function editcustomerdetail(Request $request)
   {

     /* $data=$request->all();
      echo '<pre>';
      print_r($data);die();*/

      $id=$request->id;
      $Process_name=$request->Process_name;
      $customer_id=$request->customer_id;
      $owner=$request->owner;
      $Company_name=$request->company_name;
      $customer_name=$request->customer_name;
      $mobile=$request->mobile;
      $fax=$request->fax;
      $skype_id=$request->skype_Id;
      $country=$request->country;
      $state=$request->state;
      $city=$request->city;
      $description=$request->description;


      $edit_cust = Customer::select('*')->where('id','=',$id)->first();
      //echo $edit_cust;      
      $custid=$edit_cust['customer_id'];
      date_default_timezone_set('Asia/Kolkata');
            //$currentTime = date( 'Y-m-d h:i:s', time ());
            //$updatedTime = date( 'Y-m-d h:i:s', time ());
            //$dt = date('m/d/Y');
            $customer=Customer::where('id',$id)->update(['owner'=>$owner, 'company_name'=>$Company_name, 'customer_name' =>$customer_name, 'mobile' =>$mobile, 'fax' => $fax, 'skype_id'=>$skype_id, 'country'=>$country, 'state'=>$state, 'city'=>$city, 'description'=>$description ]);


   return redirect('/admin/Editcustomer/'.$custid)->with('flash_message_error', 'Successfully Update');    
  


   }

    public function Importlead()
    {
    	 return view('/admin/importlead');
    }

    public function Managescustomer(Request $request)
    {
     
     $customerid=$request->customerid;
     //$id=$request->id;

     //$Customer = Customer::select('*')->where('customer_id','=',$customerid)->first();
     //$customer_id=$Customer['customer_id'];

     //$customer_name=$Customer['customer_name'];
     $Ticketdetail = Ticket::select("*")->where("ticket_number", "=", $customerid)->first();
     $tic=$Ticketdetail['ticket_number'];
     $customer_name=$Ticketdetail['customer_name'];
     $email=Email::select('*')->where("ticket_number","=",$tic)->first(); 
     
     /*$email = DB::table('process_ticket')
            ->join('process_email2', 'process_ticket.ticket_number', '=', 'process_email2.ticket_number')
            ->select('*')
            ->get();*/

     $ticket_view = Ticket::select('*')->where('ticket_number','=',$customerid)->first();
     
    
     $checkticket = Ticket::select('*')->where('ticket_number','=',$customerid)->get();
     //echo count($checkticket);die();
       if(count($checkticket) > 0){
        return view('/admin/Managescustomerdetails')->with(['ticket_view'=>$ticket_view, 'Ticketdetail' => $Ticketdetail, 'email' => $email ]);
       }else{
        return view('/admin/customerlistview')->with('flash_message_error','Ticket No not find');
       }



/*$id = $request->id;
        $read = $request->read;
        

        $Ticket = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();
        $logticket=$Ticket['ticket_number'];
        $logid = Log::select("*")
            ->where("ticket_number", "=", $logticket)
            ->first();
       // echo $logid=$logid['id'].'|'.$logid['noti_read'];die();
        //echo $logid.'|'.$read;die();
        $Ticketdetail = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();
        $ticket_no=$Ticketdetail['ticket_number'];
        if($read!='' && $id!=''){
        $ticketread = Log::where("id", "=", $logid)->update(["noti_read" => 1]);
        $ticketupdate = Ticket::where("ticket_number", "=", $ticket_no)->update(["noti_read" => 1]);

        }
        if (Auth::user()->user_type == "Admin") {
            return view("admin/ManagesTicketdetails")->with(
                "Ticketdetail",
                $Ticketdetail
            );
        } else {
            return view("admin/ManagesTicketdetails")->with(
                "Ticketdetail",
                $Ticketdetail
            );
        }*/



     
     
    }

    public function Editcustomer(Request $request)
    {
       $process_name='customer';
       $id=Auth::user()->id;
       $name=Auth::user()->name;
       $custid=$request->id;
       $edit_cust = Customer::select('*')->where('customer_id','=',$custid)->first();
       //echo '<pre>';
       //print_r($edit_cust);die();
       return view('/admin/Editcustomer')->with('edit_cust', $edit_cust);
    }

      public function login(Request $request)
      {
          $email=$request->email;
          $password=$request->password;
          if (Auth::attempt(['email' => $email, 'password' => $password,'user_type' => 'customer','status' => '1'])) 
                {
                $request->session()->put('data', $request->input());
                if($request->session()->has('data'))
                  {
                    return view('/dashboard');
                  } 
            }else{
                
                return redirect('/customerlogin')->with('flash_message_error','Invalid Username or Password');
            }
      }


      public function getregister()
      {
        return view('/register');
      }

      public function userstore(Request $request)
      { 
            $user = User::select('*')->where('email','=',$request->email)->get();
            if(count($user) > 0){
            $arr = array('msg' => 'User Email Already Exit. Please Use Another Email!', "response_code" => '201');
            }else{
                        $user_id=mt_rand(00000,99999);
                        $User = new User();
                        $User->username = $request->userid;
                        $User->user_id = $user_id;
                        $User->name = $request->name;
                        $User->email = $request->email;
                        $User->password =  Hash::make($request->password);
                        $User->phone_number = $request->mobNo;
                        $User->company_name = $request->companyName;
                        $User->designation = $request->designation;
                        $User->Process_name = 'Ticket';
                        $User->department_name = 'IT';
                        $User->user_type = 'customer';
                        $User->remember_token = $request->_token;
                        $User->status = 1;
                        $User->created_by = 'customer';
                        $User->save();

                        if($User){
                          $arr = array('msg' => 'Successfully User Created.Please Login here', "response_code" => '201');
                          
                        }else {
                          $arr = array('msg' => 'Successfully not User Created', "response_code" => '301');
                        }
           }

            return response()->json($arr, 201);
              
      }

      public function custlogout(){
        //$user = Auth::user();
        // logout user
        //$userToLogout = User::find(5);
        //Auth::setUser($userToLogout);
        //Sess::where('session_id', Auth::user()->id)->where('last_activity', 1)->delete();

        Auth::logout();
        Session::flush();
        return redirect('/customerlogin')->with('flash_message_success','Logged out Successfully'); 
    }
      public function dashboard()
      {
        if(session()->has('data'))
        {
          //echo Auth::user()->id;
          //echo Auth::user()->name;die;
            $user=User::all();
            return view('/dashboard')->with('user',$user);
        }else{
            session()->forget('data');
            return redirect('/customerlogin')->with('flash_message_error','Please login to access');
        }
        
    }

    public function customershow()
    {
        return view('customerlogin');
    }

    public function ticketstatus()
    {
     return view('ticket-status');   
    }

    public function forgotpasswordmail()
    {
       return view('/forgotpassword');
    }

    public function recoverypass(Request $request)
    {
           $email=$request->email;
           $user = User::select('*')->where('email','=',$email)->get();
           if(count($user) > 0){

            foreach ($user as $key => $value) {
              
                $datasend = array(
                 'id' => $value->id, 
                 'name'=> $value->name
                 );
                 Mail::to($email)->send(new Forgotpassword($datasend));  
            }
              return redirect('/forgotpassword')->with('flash_message_success','We’ve sent an email to your email address. Follow the steps provided in the email to update your password or select Log In if you don’t want to change your password at this time.');
           }else{
              return redirect('/forgotpassword')->with('flash_message_error','Your Email Id not find in database');
           }
    }
    public function reset(Request $request)
    {
        $id = $request->id;
        return view('resetpassword')->with('id',$id);
    }
    public function newpassset(Request $request)
      {
          $data = $request->all();
          //$id=Auth::user()->id;
          //echo '<pre>';
          //print_r($data);die();

          $validator = Validator::make($data, [
                'password' => ['required', 'string', 'min:8', 'confirmed'],
                ]);

            $validator->validate();
            
             $result  = User::where('id',$data['id'])->update(['password'=>Hash::make($data['password'])]);
            
             if($result){ 
               return redirect('/resetpassword/'.$data['id'])->with('flash_message_success','Successfully Change Password. Please login Again!');
                //return view('streamshow');
            } else {
                return redirect('/resetpassword/'.$data['id'])->with('flash_message_error','There has been an error!');
            }
    }

    public function profiledisplay()
    {
       $user = User::select('*')->where('id',Auth::user()->id)->first(); 
       return view('profile')->with('user',$user);    
    }

    public function historydisplay()
    {
       $Tickethistory = Ticket::select('*')->where('email_id',Auth::user()->email)->get(); 
       return view('history')->with('Tickethistory',$Tickethistory);  
    }
    public function gethistory(Request $request)
    {
        $Tickethistory = Ticket::select('*')->where('email_id',Auth::user()->email)->get(); 
       return view('history')->with('Tickethistory',$Tickethistory);
        /*if ($request->ajax()) {
            $data = User::all();
            print_r($data);die(); 

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" class="delete btn btn-danger btn-sm">Delete</a>';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }*/
    }

    public function ticketlist()
    {
       $Tickethistory = Ticket::select('*')->where('email_id',Auth::user()->email)->get(); 
       return view('ticket_list')->with('Tickethistory',$Tickethistory); 
    }

    public function searchtickethistory(Request $request)
    {
     $ticketno=$request->Ticket_status;   
     $Logfiles =Logfiles::where('ticket_number',$ticketno)
     ->orderBy('modified_date','desc')
    ->get();
    return view('ticket-status')->with('ticketno',$ticketno); 
       
    }

    public function countrydel(Request $request)
    {
        
     $id = $request->id;
     $duplistatecheck= State::select('*')->where('country_id','=', $id)->get();
     
     if(count($duplistatecheck) > 0){
        return redirect('/admin/countrystatecity')->with('flash_message_error', 'already hierarchy exists Then delete below Leavel hierarchy Deleted!');
     }else{   
     $Categorysub = Country::where('name','=',$id);
     $Categorysub->delete();
     return redirect('/admin/countrystatecity')->with('flash_message_error', 'Successfully Delete');
     }
    }

   public function statedel(Request $request)
   {
    $id= $request->id;

    $duplicitycheck= City::select('*')->where('state_id','=', $id)->get();
     
     if(count($duplicitycheck) > 0){
        return redirect('/admin/countrystatecity')->with('flash_message_error', 'already hierarchy exists Then delete below Leavel hierarchy Deleted!');
     }else{   
     $State = State::where('name','=',$id);
     $State->delete();
     return redirect('/admin/countrystatecity')->with('flash_message_error', 'Successfully Delete');
     }    
   }
   
   public function citydel(Request $request)
   {
     $City = City::where('id','=',$request->id);
     $City->delete();
     return redirect('/admin/countrystatecity')->with('flash_message_error', 'Successfully Delete');
   }

   public function get_status()
   {
       return view('statusticket');
   }

   public function search_history(Request $request)
   {
      $ticketno=$request->Ticket_status;
      

     $Logfiles =Logfiles::where('ticket_number',$ticketno)
     ->orderBy('modified_date','desc')
    ->get();
    return view('statusticket')->with('ticketno',$ticketno);
   }
  

  public function postfeedback(Request $request)
{
    $data=$request->all();
    //print_r($data);die();
        
        $dt=date("Y-m-d H:i:s");
        $dt1=date("Y-m-d H:i");
        $sec=date("s")+20;
        $dt2=date("Y-m-d H:i".':'.$sec);
        $feadback='The ticket Number is '.$data['ticketno'].' ? '.$data['feedback'];
        $system_remark='Ticket has been Closed by '.$data['custname'];
        $case_status='Ticket Closed';

        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $data['ticketno'];
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $data['user_id'];
        $Logfiles->user_name = $data['custname'];
        $Logfiles->status = 'Feedback';
        $Logfiles->owner = $data['owner'];
        $Logfiles->modified_date = $dt2;
        $Logfiles->sub_status = 'Feedback';
        $Logfiles->save();
        
        $updateuser  = Logfiles::where('ticket_number','=',$data['ticketno'])->where('status','=', 'Closed')->update(['feedback_status'=>'1']);
        
        $data = array(
         'ticno'=> $data['ticketno'],
         'customer_name' => $data['custname'],
         'feadback' => $feadback,
         'system_remark' => $system_remark,
         'status' => 'feedback'
       );

        return response()->json($data);
}
}
