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
use Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Mail;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Datatables;
use Auth;
use Session;
use App\User;
use App\Ticket; 
use App\Categorysub;
use App\Status;
use App\Product;
use App\Department;
use App\Log;
use App\Processlist;
use App\Tablefleldlist;
use App\Process_rca;
use App\Calendartbl;
use App\Customer;
use App\Note;
use App\Task;
use App\Sess;
use App\subcategory;
use Carbon\Carbon;
use App\Mail\Assign;
use App\Mail\CloseTicket;
use App\Mail\Tatdelivery;
use App\Mail\Activity;


class AdminController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */
   //use AuthenticatesUsers;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    

 /*public function admin(Request $request){

        if($request->isMethod('post')){
            $title = 'Dashboard';
            $data = $request->input();
             if (Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status' => '1'])) {
                $request->session()->put('datas', $request->input());
                if($request->session()->has('datas'))
                  {
            return redirect('/admin/dashboard');
                  }  
            }else{
                
                return redirect('/admin')->with('flash_message_error','Invalid Username or Password');
            }
        }
         if(session()->has('datas')){
           return redirect('/admin/dashboard');
         }else{
        return view('admin.login');
        }
    }*/

public function admin(Request $request){
            
          $startTime='';
          $min=''; 
         if($request->isMethod('post')){
            $title = 'Dashboard';
            $data = $request->input();
            date_default_timezone_set('Asia/Kolkata');
            $dt=date("YmdHis");
            //$ss=check_session();
            $usercheck = Sess::select('*')->where('user_agent', $data['email'])->get();
            foreach ($usercheck as $key => $value) {
                       $date = $value->updated_at;
                       if($date==''){
                        $startTime = now()->toDateTimeString();
                        $endTime = now();

               // $totalDuration =  $startTime->diff($endTime)->format('%H:%I:%S');
                 $totalDuration =  $startTime->diff($endTime)->format('%H');
                 $min = ($totalDuration * 60);
                        }else{
                        $startTime = $date;
                        $endTime = now();

               // $totalDuration =  $startTime->diff($endTime)->format('%H:%I:%S');
                 $totalDuration =  $startTime->diff($endTime)->format('%H');
                 $min = ($totalDuration * 60);
            }
       }       
      
    $user = Sess::select('*')->where('user_agent', $data['email'])->get();
   
          if($min > 60 && $min!=''){
            
            Sess::where('user_agent', $data['email'])->delete();  
            if (Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status' => '1'])) 
                {
                    $request->session()->put('datas', $request->input());
                    if($request->session()->has('datas'))
                      {
                        $name=Auth::user()->name;
                        $name_first=explode(" ",$name);
                        $nf=$name_first[0].'_'.$dt;
                        
                        $Sess = new Sess();
                        $Sess->session_id = Auth::user()->id;
                        $Sess->ip_address = ':80';
                        $Sess->user_agent = Auth::user()->email;
                        $Sess->session_name = $nf;
                        $Sess->save();
                        return redirect('/admin/dashboard');
                      } 

                }else{
                  return redirect('/admin')->with('flash_message_error','Invalid Username or Password');   
                }   
            
          }elseif(count($user) > 0){
            
            return redirect('/admin')->with('flash_message_error','Your account login from another device!!');
             }elseif(count($user) == 0){
               if (Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status' => '1'])) 
                {
                    $request->session()->put('datas', $request->input());
                    if($request->session()->has('datas'))
                      {
                        $name=Auth::user()->name;
                        $name_first=explode(" ",$name);
                        $nf=$name_first[0].'_'.$dt;
                        
                        $Sess = new Sess();
                        $Sess->session_id = Auth::user()->id;
                        $Sess->ip_address = ':80';
                        $Sess->user_agent = Auth::user()->email;
                        $Sess->session_name = $nf;
                        $Sess->save();
                        return redirect('/admin/dashboard');
                      } 

                }else{
                  return redirect('/admin')->with('flash_message_error','Invalid Username or Password');   
                }   
             }
         }
    if(session()->has('datas')){
      return redirect('/admin/dashboard');
    }else{
        return view('admin.login');
    }
    }



  public function logout(){
        //$user = Auth::user();
        // logout user
        //$userToLogout = User::find(5);
        //Auth::setUser($userToLogout);
        Sess::where('session_id', Auth::user()->id)->where('last_activity', 1)->delete();

        Auth::logout();
        Session::flush();
        return redirect('/admin')->with('flash_message_success','Logged out Successfully'); 
    }
    public function dashboard(){
        if(session()->has('datas'))
        {
          //echo Auth::user()->id;
          //echo Auth::user()->name;die;
            $user=User::all();
            return view('/admin/dashboard')->with('user',$user);
        }else{
            session()->forget('datas');
            return redirect('/admin')->with('flash_message_error','Please login to access');
        }
        
    }

    public function addtat(Request $request)
    {
        $data = $request->input();
        $email=$data['emaildelivery'];
        $updateticket  = Ticket::where('id','=',$data['ticketid'])->update([ 'del_date_tat'=>$data['delivery_date'], 'del_time_tat'=>$data['delivery_time'], 'del_comm_tat'=>$data['deliver_comment'] ]);

        $datasend = array(
                 'customer_name_delivery' => $data['customer_name_delivery'], 
                 'emaildelivery'=> $data['emaildelivery'],
                 'ticket_number' => $data['ticket_number'],
                 'delivery_date' => $data['delivery_date'],
                 'delivery_time' => $data['delivery_time'],
                 'deliver_comment' => $data['deliver_comment']
                 );

            Mail::to($email)->send(new Tatdelivery($datasend));

            /*$result = array(
            "message" => 'Ticket Closed to successfully',
            "response_code" => '201',
            "heading" => 'Ticket Closed to successfully',
            "text" => 'Closed the ticket',
            "icon" => 'success'
             );*/

    return redirect('/admin/ManagesTicketdetails/'.$data['ticketid'])->with('success', 'Successfully Add!');
    }
    
    public function sendsms(Request $request)
    {
        $data=$request->all();
        
        $port_id=0;
        $i=1;

        $json_string_data = '{"text":"'.$data['comment'].'","param":[{"number":"'.$data['mobileno'].'","text_param":"new","user_id":"'.$i.'"}],"port":['.$port_id.']}';
        //$gateway_ip = "122.161.195.61";
        $username="admin";
        $password="xspl@123";
        $ch = curl_init('http://192.168.1.211/api/send_sms');
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json_string_data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
          'Content-Type: application/json',
          'version: 1.0.2',
          'Content-Length: ' . strlen($json_string_data))
        );
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $result = curl_exec($ch);

        curl_close($ch);
        $response_array = json_decode($result, TRUE);
        
        //return $response_array;die();

        $status_code=$response_array['error_code'];
        
        if($status_code==202){
        return redirect('/admin/ManagesTicketdetails/'.$data['ticketid'])->with('success', 'Successfully Send Messages!');
        }else{
            return redirect('/admin/ManagesTicketdetails/'.$data['ticketid'])->with('error', 'error some Messages!');  
        }
    }

    public function addticket() 
    {
       return view('/admin/addticket'); 
    }
    public function ticketListview() 
    {
    
       return view('admin/ticketlist'); 
    }
    
    public function getTicketlist(){
        $usersQuery = Ticket::query();
        $role=Auth::user()->user_type;
        $owner_name_assign=Auth::user()->name;
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
      if($role=='Admin'){
        $users = $usersQuery->select('id','ticket_number','mobile','customer_name','owner','created_by','status')->orderBy('id', 'DESC');
        }elseif($role=='TL'){
        $users = $usersQuery->select('id','ticket_number','mobile','customer_name','owner','created_by','status')->orderBy('id', 'DESC');
        }else{
         $users = $usersQuery->select('id','ticket_number','mobile','customer_name','owner','created_by','status')->where('owner','=', $owner_name_assign)->orderBy('id', 'DESC'); 
        }
        
    
        return datatables()->of($users) 
             ->addColumn('checkbox', function($data) {
                  if($data->status == 'Open'){
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';
                  }else if($data->status == 'Resolve'){
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';
                  }else if($data->status == 'Hold'){
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';
                  }else if($data->status == 'Working'){
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'"    name="chk[]" />';        
                  }else if($data->status == 'Closed'){
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->id.'" disabled="disabled"   name="chk[]" />';
                  }
              })

            ->addColumn('action', function($users){
              $viewUrl = url('/admin/ManagesTicketdetails/'.$users->id );
                   $btn = '<a href="'.$viewUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View"></i> </a>';
                   return $btn;
            })
            ->rawColumns(['checkbox','action']) 
            ->make(true);
   }
   
   public function ticketclosed(Request $request)
    {
         /*$id=$request->input('id');
         print_r($id);
         die();*/

        foreach($request->input('id') as $key => $ticketid)
           {
           
          $fatch_email  = Ticket::select('*')->where('id','=',$ticketid)->first(); 
          
           $ticket_id = Ticket::find($ticketid);
           $ticket_id->status = 'Closed';
           $ticket_id->sub_status ='Closed';
           $ticket_id->update();
           
          $ticket_number=$ticket_id->ticket_number;
         

          $system_remark='The status has been closed by '.Auth::user()->name;
          $case_status='Ticket closed';
          $feadback=Auth::user()->name.'Status changed from '.$ticket_id->status.' to Closed';
          $user_id=Auth::user()->id;
          $user_name=Auth::user()->name;
          $status=$ticket_id->status;
          $sub_status=$ticket_id->sub_status;
          $owner=$ticket_id->owner;
          }
            $Log = new Log;
            $Log->ticket_number = $ticket_number;
            $Log->process_name = 'HISTORY';
            $Log->system_remark = $system_remark;
            $Log->case_status = 'Ticket closed';
            $Log->feadback = $feadback;
            $Log->user_id = $user_id;
            $Log->user_name = $user_name;
            $Log->status = $status;
            $Log->owner = $owner;
            $Log->sub_status = $sub_status;
            $Log->save();
        

        $data = array(
                 'customer_name' => $fatch_email['customer_name'], 
                 'ticket_number'=> $ticket_number,
                 'system_remark' => $system_remark,
                 'case_status' => $case_status,
                 'feadback' => $feadback,
                 'status' => $status
                 );

            Mail::to($fatch_email['email_id'])->send(new CloseTicket($data));

            $result = array(
            "message" => 'Ticket Closed to successfully',
            "response_code" => '201',
            "heading" => 'Ticket Closed to successfully',
            "text" => 'Closed the ticket',
            "icon" => 'success'
             );
           
          
       return response()->json($result);
     
    }


public function owner_name_assign(Request $request)
    {
       
       //$data=$request->all();

       $user_id=$request->user_id;
       $agent_id=$request->agent_id;
       $ticket=$request->ticket_number;
       $User=User::select('*')->where('id','=',$user_id)->first(); 
       $assign_email=$User['email'];


       foreach($ticket as  $key => $ticketid)
           {
            //echo $ticketid[$key];die();

            $Ticketfind  = Ticket::select('*')->where('id','=',$ticket[$key])->get();  
            foreach ($Ticketfind as $key => $Ticketdetail) {
            $logTicket=$Ticketdetail->ticket_number;
            $email_id = $Ticketdetail->email_id;          

            
            $Ticketupdate  = Ticket::where('ticket_number','=',$Ticketdetail->ticket_number)->update(['owner'=>$agent_id]);

            $Task  = Task::where('ticket_number','=',$Ticketdetail->ticket_number)->update(['owner'=>$agent_id]);
            
            $system_remark='This ticket assigned to '.$agent_id.' assign by '.Auth::user()->name;
            $case_status='Ticket assigned';
            $feadback=Auth::user()->name.' Assigned the ticket';
            $user_name=Auth::user()->name;
            $user_id=Auth::user()->id;
            $status=$Ticketdetail->status;
            $sub_status=$Ticketdetail->sub_status;
            $owner=$Ticketdetail->owner;

            $Log = new Log;
            $Log->ticket_number = $logTicket;
            $Log->process_name = 'HISTORY';
            $Log->system_remark = $system_remark;
            $Log->case_status = $case_status;
            $Log->feadback = $feadback;
            $Log->user_id = $user_id;
            $Log->user_name = $user_name;
            $Log->status = $status;
            $Log->sub_status = $sub_status;
            $Log->owner = $owner;
            $Log->save();


            $data = array(
                 'agent_id'=> $agent_id,
                 'logTicket' => $logTicket,
                 'system_remark' => $system_remark,
                 'case_status' => $case_status,
                 'status' => $status
                 
               );

            Mail::to($assign_email,$email_id)->send(new Assign($data));
            
            $result = array(
            "msg" => 'Ticket assigned to successfully',
            "response_code" => '3001',
            "heading" => 'Ticket assigned to successfully',
            "text" => 'Assigned the ticket',
            "icon" => 'success'
             );
            

            }

           }
           
      return response()->json($result);    
     
    }
  public function ManagesTicketdetails(Request $request)
  {
    $id = $request->id;
    $Ticketdetail = Ticket::select('*')->where('id','=',$id)->first();
    
    return view('/admin/ManagesTicketdetails')->with('Ticketdetail', $Ticketdetail);    
   }
   
  /*public function logdetail(Request $request)
    {
      $id = $request->id;
      
      $log = DB::table('process_log')->select('*')->where('ticket_number','=', $id)->get();
      print_r($log);die;
      return view('/admin/ManagesTicketdetails')->with('log', $log); 
    } */
   

    public function Solutions()
    {
      return view('/admin/Solutions');//->with('showallcate',$showallcate);    
    }
   
    public function catedelete(Request $request){
    
    $id = $request->id;
    
     $Categorysub = Categorysub::find($id);
     $Categorysub->delete();
    return redirect('/admin/category')->with('flash_message_error', 'Successfully Delete');;
    
    }
    public function catesubdelete(Request $request){
    
     $id = $request->id;
     $Categorysub = subcategory::find($id);
     $Categorysub->delete();
    return redirect('/admin/category')->with('flash_message_error', 'Successfully Delete');
    
    }

    public function changepassword()
    {
       return view('/admin/changepassword');   
    }

    public function resetpass(Request $request)
    {

        

      $data = $request->all();
      $id=Auth::user()->id;
      //echo '<pre>';
      //print_r($data);die();

      $validator = Validator::make($data, [
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            ]);

        $validator->validate();
       
        $result  = User::where('id',$id)->update(['password'=>Hash::make($data['password'])]);
        
         if($result){ 
           return redirect('/admin/changepassword')->with('success', "Successfully Change Password. Please login Again!");
            //return view('streamshow');
        } else {
            return redirect('/admin/changepassword')->with('error', "There has been an error!");
        }  
    }

    public function category(){
      $showallcate = Categorysub::select('*')->orderBy('id', 'DESC')->get();
      return view('/admin/newcategory')->with('showallcate', $showallcate);      
    }
    
    public function edit_category(Request $request)
    {
      $id=$request->id;
      $Categorysub = Categorysub::find($id);
      $id=$Categorysub->id;
      $category_name=$Categorysub->category_name;
      $arr = array(
            'id' => $id,
            'category_name' => $category_name
            
        );
      
      return response()->json($arr);  
    }

    public function category_edit(Request $request)
    {
     $id=$request->edit_categoryid;
     $category_name=$request->category_name;

    $updatecategory = Categorysub::where('id','=',$id)->update(['category_name'=>$category_name]);

        if($updatecategory){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr);
    
    }

    public function subcategory(){
      $subcategory = Categorysub::select('*')->orderBy('id', 'DESC')->get();
      return view('/admin/subcategory')->with('subcategory', $subcategory);      
    }
 
    public function edit_subcategory(Request $request)
    {
      $id=$request->id;
      $subcategory = subcategory::where('id',$id)->get();
      
      foreach ($subcategory as $key => $subcategorys) {
      $id=$subcategorys->id;
      $category_name=$subcategorys->cateid;
      $sub_category=$subcategorys->sub_category;
      $arr = array(
            'id' => $id,
            'category_name' => $category_name,
            'sub_category' => $sub_category,
            
        ); 
      }
     
      return response()->json($arr);  
    }
   
    public function subcategory_edit(Request $request)
    {

        $id=$request->edit_subcategoryid;
        $category_name=$request->category_name;
        $subcate=$request->subcate;
        //echo $id .'|'. $category_name .'|'. $subcate;
        //die();       

        $updatesubcategory = subcategory::where('id','=',$id)->update(['sub_category' => $subcate]);

        if($updatesubcategory){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr);
    }


    public function storenewcategory(Request $request)
    {
      
     $input = $request->all();

     $request->validate([
       'category_name' => 'required'
     ]);
     $duplicatecheck= Categorysub::select('*')->where('category_name','=', $input['category_name'])->get();
     if(count($duplicatecheck) > 0){
       $arr = array('msg' => 'Already Categoy Exit!', 'status' => true); 
     }else{
         $check = Categorysub::create($input);
    
         if($check)
         { 
            $arr = array('msg' => 'Successfully Add Category', 'status' => true);
         }else{
           $arr = array('msg' => 'Server error. Please try again later', 'status' =>false);  
         }
     }
     return response()->json($arr);  
    }

    public function storesubcategory(Request $request)
    {
    
    $input = $request->all();
   
     $request->validate([
       'category_name' => 'required',
       'sub_category' => 'required'
     ]);

     $duplicatecheck= subcategory::select('*')->where('sub_category','=', $input['sub_category'])->get();
     
     if(count($duplicatecheck) > 0){
         $arr = array('msg' => 'Already Categoy Exit!', 'status' => true); 
     }else{
            $check = new subcategory;
            $check->cateid = $input['category_name'];
            $check->sub_category = $input['sub_category'];
            $check->save();
             
             if($check)
             { 
                $arr = array('msg' => 'Successfully Add Sub Category', 'status' => true);
             }else{
                $arr = array('msg' => 'Server error. Please try again later', 'status' =>false);    
             }
     }
    return response()->json($arr); 

    }


    public function fetchsubcategory(Request $request)
    {
        $Category=$request->Category;   
        $data = subcategory::where("cateid",$Category)->get();
        return response()->json($data);
    }

    public function create_status(){
     $status = DB::table('dispostion')->select('*')->where('Process_name','=', 'Ticket')->orderBy('id', 'DESC')->get();
      return view('/admin/create_status')->with('status', $status); 
    } 

    public function substatus_new_add(Request $request){
     $input = $request->all();
     $request->validate([
       'sub_status' => 'required',
       'status' => 'required'
     ]);
     $check = Status::create($input);
     $arr = array('msg' => 'Something goes to wrong. Please try again later', 'status' =>false);
     if($check)
     { 
        $arr = array('msg' => 'Successfully Form Submit', 'status' => true);
     }
      return response()->json($arr);

    }

    public function status_sub_delete(Request $request){
     $id = $request->id;
     $Status = Status::find($id);
     $Status->delete();
    return redirect('/admin/create_status')->with('flash_message_error', 'Successfully Delete');
    }

    public function cateproduct(){
    $Product = Product::select('*')->orderBy('id', 'DESC')->get();
      return view('/admin/product')->with('Product', $Product); 
    }
    public function store_product(Request $request){
     $input = $request->all();
     //print_r($input);die();

     $request->validate([
       'product' => 'required',
       'product_category' => 'required'
       //'owner' => 'required'
     ]);
        //$check = Product::create($input);

        $check = new Product();
        $check->product = $input['product'];
        $check->product_code = $input['product_code'];
        $check->product_brand = $input['product_brand'];
        $check->product_category = $input['product_category'];
        $check->owner = Auth::user()->name;
        
        $check->created_at = date('Y-m-d H:i:s');
        $check->updated_at = date('Y-m-d H:i:s');
        $check->save();
     
         if($check)
         { 
            $arr = array('msg' => 'Successfully add Product', 'status' => true);
         }else{
            $arr = array('msg' => 'server error. Please try again later', 'status' =>false);   
         }
      return response()->json($arr);
    }

    public function product_edit(Request $request)
    {
      $id=$request->id;
      $Product = Product::find($id);
      $product=$Product->product;
      $product_code=$Product->product_code;
      $product_category=$Product->product_category;
      $product_brand=$Product->product_brand;
      $owner=$Product->owner;
      $arr = array(
            'id' => $id,
            'product' => $product,
            'product_code' => $product_code,
            'product_category' => $product_category,
            'product_brand' => $product_brand,
            'owner' => $owner
        );
      return response()->json($arr);
    }

  public function edit_productdetail(Request $request)
  {
        //$data=$request->all();
        //print_r($data);die();
        $id=$request->edit_id;
        $product=$request->product;
        $product_code=$request->product_code;
        $product_brand=$request->product_brand;
 $updateproduct = Product::where('id','=',$id)->update(['product'=>$product,'product_code'=>$product_code,'product_brand'=>$product_brand]);

        if($updateproduct){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr);
  }


    public function product_delete(Request $request){
     $id = $request->id;
     $Product = Product::find($id);
     $Product->delete();
    return redirect('/admin/product')->with('flash_message_error', 'Successfully Delete');
    }
   
   public function department(){
      $Department = Department::select('*')->orderBy('id', 'DESC')->get();
      return view('/admin/department')->with('Department', $Department);
  }
   public function store_department(Request $request){
     $input = $request->all();
     $request->validate([
       'department_name' => 'required',
       'process_name' => 'required'
     ]);
     $check = Department::create($input);
     $arr = array('msg' => 'Something goes to wrong. Please try again later', 'status' =>false);
     if($check)
     { 
        $arr = array('msg' => 'Successfully Form Submit', 'status' => true);
     }
      return response()->json($arr);

    }
   public function dept_edit(Request $request){
    $id = $request->id;
    $Dept = Department::select('*')->where('id','=',$id)->first();
       return view('/admin/dept_edit')->with('Dept', $Dept);
   }

   public function EditTicket(Request $request){
      $id = $request->id;
      $edittic = Ticket::select('*')->where('ticket_number','=',$id)->first();
       return view('/admin/EditTicket')->with('edittic', $edittic);
    }
   public function updateticketstore(Request $request)
   {
           //$data=$request->all();
           //print_r($data);

           //echo  $request->subject;die;
            $ticketno=$request->hdn;

            date_default_timezone_set('Asia/Kolkata');
            //$currentTime = date( 'Y-m-d h:i:s', time ());
            $updatedTime = date( 'Y-m-d h:i:s', time ());
            $dt = date('m/d/Y');
            Ticket::where('ticket_number',$ticketno)->update(['subject'=>$request->subject,'type'=>$request->type,'category'=>$request->category,'sub_category'=>$request->sub_category,'status'=>$request->status,'sub_status'=>$request->sub_status,'source'=>$request->source,'source_value'=>$request->source_value, 'product'=>$request->product, 'tat'=>$request->tat, 'voc'=>$request->voc, 'department'=>$request->department, 'owner'=>$request->owner, 'closure_date'=>$dt, 'remarks'=>$request->remarks, 'updated_at'=>$updatedTime ]);


   return redirect('/admin/EditTicket/'.$ticketno)->with('flash_message_error', 'Successfully Update'); 

   }
   public function deptupdate($id)
   {
        $Department = Department::find($id);
        $Department->department_name = request('dptname');
        $Department->save();
       
        return json_encode(array('statusCode'=>200));
   }

     public function department_del(Request $request){
     $id = $request->id;
     $Department = Department::find($id);
     $Department->delete();
     return redirect('/admin/department')->with('flash_message_error', 'Successfully Delete');   
    }
  public function chkPassword(Request $request){
        $data = $request->all();
        $current_password = $data['current_pwd'];
        $check_password = User::where(['admin'=>'1'])->first();
        if(Hash::check($current_password,$check_password->password)){
            echo "true"; die;
        }else {
            echo "false"; die;
        }
    }

    public function updatePassword(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            //echo "<pre>"; print_r($data); die;
            $check_password = User::where(['email' => Auth::user()->email])->first();
            $current_password = $data['current_pwd'];
            if(Hash::check($current_password,$check_password->password)){
                $password = bcrypt($data['new_pwd']);
                User::where('id','1')->update(['password'=>$password]);
                return redirect('/admin/settings')->with('flash_message_success','Password updated Successfully!');
            }else {
                return redirect('/admin/settings')->with('flash_message_error','Incorrect Current Password!');
            }
        }
    }


    

    public function register() {
        return view('register');
        die;
    }

    public function AddUser(Request $request) 
    {
        $user = new User;
        $user->email = $request->email;
        $user->name = $request->name;
        $user->password = Hash::make($request->password);
        $user->status = 1;
        $user->created_at = date('Y-m-d H:i:s');
        $user->updated_at = date('Y-m-d H:i:s');
        $user->save();
        
        return view('register');
    }

    public function employeelist(Request $request)
    {
      return view('/admin/employeelist');
    }
    public function getemployeelist(){
      
      $usersQuery = User::query();
      
      $users = $usersQuery->select('id','name','email','user_type','images','department_name','user_id')->orderBy('id', 'DESC');
    
        return datatables()->of($users) 
             ->addColumn('checkbox', function($data){
                 
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->user_id.'"    name="chk[]" />';
                 
              })

            ->addColumn('action', function($users){
              $viewUrl = url('/admin/userscontrol/'.$users->user_id);
              $delUrl = url('/admin/usersdel/'.$users->id);
                   $btn = '<a href="'.$viewUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="fa fa-eye" aria-hidden="true" title="View"></i></a>&nbsp;&nbsp;';
                   $btn.='<a href="'.$delUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="far fa-trash-alt"></i></a>';
                   return $btn;
            })
            ->rawColumns(['checkbox','action']) 
            ->make(true); 

    }

    public function userdel(Request $request)
    {
       $id = $request->id;
        User::where('id',$id)->delete();
     
     return redirect('/admin/employeelist')->with('flash_message_success','Successfull Delete'); 
    }

    public function Manageemployeedetails(Request $request)
    {
       $id = $request->id;
       $userdetail = User::select('*')->where('user_id','=',$id)->first();
       return view('/admin/userscontrol')->with('userdetail', $userdetail);
   
    }
   public function user_update(Request $request)
   {
       $id=$request->user_id;
       $name=$request->name;
       $email=$request->email;
       $phone=$request->phone_number;
       $country=$request->country;
       $department=$request->department_name;
       
       $userstatus=User::where('user_id','=',$id)->update(['name'=>$name,'email'=>$email,'phone_number'=>$phone,'country'=>$country,'department_name'=>$department]);
       if($userstatus){
         $arr = array(
                "msg" => 'Successfully updated',
                "response_code" => '201',
                );
       }else{
         $arr = array(
                "msg" => 'Successfully not updated',
                "response_code" => '301',
                ); 

       }
       return response()->json($arr);
   }

   public function createemployee(Request $request)
   {
      $user_name=$request->user_name;
      $user_email=$request->user_email;
      $user_pass=$request->user_pass;
      $user_type=$request->user_type;
      $department_name=$request->department_name;
      $Process_name=$request->Process_name;
      $token=$request->_token;
      $user_id=mt_rand(00000,99999);
      $usercheck = User::select('*')->where('email','=',$user_email)->get();
      //if($Licenses_limit>$count_licenses){
      if(count($usercheck) == 0){
       
        $user = new User;
        $user->user_id = $user_id;
        $user->name = $user_name;
        $user->email  = $user_email;
        $user->password = Hash::make($user_pass);
        //$user->password = $user_pass;
        $user->user_type = $user_type;
        $user->department_name = $department_name;
        $user->remember_token = $token;
        $user->chat_status = 'Offline';
        $user->status_live = 'success';
        $user->Process_name = 'Ticket';
        $user->status = '1';
        $user->save(); 
         
       $arr = array(
            "msg" => '  add successfully',
            "response_code" => '3001',
            );

      }else{

        $arr = array(
            "msg" => 'Already add',
            "response_code" => '2001',
            );
    }
    return response()->json($arr);
   //}
   }

   public function process_list()
   {
     $processlist = Processlist::select('*')->orderBy('id', 'DESC')->get();

     return view('/admin/process_list')->with('processlist', $processlist); 
   }
   public function process_list_gui(Request $request)
   {
    $process_id=$request->process_id;
    $process_name=$request->process_name;
    $data = Processlist::select('*')->where('process_id','=',$process_id)
    ->where('process_name','=',$process_name)->get();
    
    $editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)
    ->where('process_name','=',$process_name)->first();


    return view('/admin/process_list_gui')->with(['data' => $data, 'process_id' => $process_id, 'process_name' => $process_name]); 
   }

   public function created_process(Request $request)
   {
        //echo $request->process_id;die;
        $processlist = Processlist::select('*')->orderBy('id', 'DESC')->get();
        $dt=date('Y-m-d');
        $Processlist = new Processlist;
        $Processlist->process_id = $request->process_id;
        $Processlist->process_name  = $request->process_name;
        $Processlist->created_date  = $dt;
        $Processlist->status = $request->status;
        $Processlist->save(); 
        if($Processlist){  
        $arr = array(
            "msg" => 'Successfull',
            "response_code" => '201',
            );

       }else{
       $arr = array(
            "msg" => 'UnSuccessfull',
            "response_code" => '301',
            );
       }
    return redirect('/admin/process_list')->with(['arr' => $arr, 'processlist' => $processlist]); 
   }
   public function process_list_del(Request $request)
   {
     $id=$request->id;
     Processlist::find($id)->delete();
     $processlist = Processlist::select('*')->orderBy('id', 'DESC')->get();
     return redirect('/admin/process_list')->with(['processlist' => $processlist]);
   }


   public function dynamicfield(Request $request)
   {
        
        $input_label=$request->input_label;
        $field_type=$request->field_type;
        $field_colm=$request->field_colm;
        $field_colm1=str_replace(' ','_',$field_colm);
        $level_name=$request->level_name;
        $extra_values=$request->extra_values;
        $process_id=$request->process_id;
        $process_name=$request->process_name;

        
        $Processlist = new Tablefleldlist;
        $Processlist->process_id = $process_id;
        $Processlist->process_name  = $process_name;
        $Processlist->field_colm  = $field_colm1;
        $Processlist->field_type = $field_type;
        $Processlist->extra_values = $extra_values;
        $Processlist->input_label =$input_label; 
        $Processlist->input_name = $field_colm1;
        $Processlist->level = $level_name;
        $Processlist->save(); 
        if($Processlist){
           if($field_colm!='header')
           {
             $table_name='process_'.$process_name;

             Schema::table($table_name, function(Blueprint $table) use ($field_colm1, &$fluent)
             {
              $fluent = $table->string($field_colm1)->nullable();
             });
             $arr = array("msg" => 'Successfull');
             }
        
        }else{
        $arr = array("msg" => 'UnSuccessfull');
        }
      return response()->json($arr);
   }

public function process_list_gui_edit(Request $request)
{
        $process_id=$request->process_id;
        $process_name=$request->process_name;
       
        $editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)->get();

  return view('/admin/process_list_gui')->with(['editlist' => $editlist, 'process_id' => $process_id, 'process_name' => $process_name]);
}
public function dynamicfield_fetch(Request $request)
{
  $id=$request->id;
  $process_id=$request->process_id;
  $process_name=$request->process_name;
  $editlist = Tablefleldlist::select('*')->where('id','=',$id)->first();


  return view('/admin/process_list_gui')->with(['editlist' => $editlist, 'process_id' => $process_id, 'process_name' => $process_name]);
}

public function created_dynamic_field_edit(Request $request)
{
        $id=$request->hdn;
        $input_label=$request->input_label;
        $field_type=$request->field_type;
        $field_colm=$request->field_colm;
        $field_colm1=str_replace(' ','_',$field_colm);
        $level_name=$request->level_name;
        $extra_values=$request->extra_values;
        $process_id=$request->process_id;
        $process_name=$request->process_name; 

        $updatelist = Tablefleldlist::where('id','=',$id)->update(['field_type'=>$field_type,'extra_values'=>$extra_values,'level'=>$level_name ]);

        if($updatelist){
           //$editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)
           //->where('process_name','=',$process_name)->first();
           $arr = array("msg" => 'Successfull Update');
        
        }else{
        
           //$editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)
           //->where('process_name','=',$process_name)->first();
           $arr = array("msg" => 'UnSuccessfull Update');
        
        }
        return response()->json($arr);  
}

    public function process_list_gui_feild_del(Request $request)
    {
         
         $id=$request->id;
         $field_colm=$request->field_colm;
         $process_id=$request->process_id;
         $process_name=$request->process_name;
         Tablefleldlist::find($id)->delete();
         $table_name='process_'.$process_name;
         //echo $field_colm;die;
        if (Schema::hasColumn($table_name, $field_colm))
         {
         Schema::table($table_name, function(Blueprint $table) use ($field_colm, &$fluent)
             {
              $table->dropColumn($field_colm);
             });
         }
         
         $editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)->get();

  return redirect('/admin/process_list_gui/'.$process_id.'/'.$process_name)->with(['editlist' => $editlist, 'process_id' => $process_id, 'process_name' => $process_name]);
    }
public function rcashow()
{
   $rcalist = Process_rca::select('*')->get();  
   return view('/admin/rca')->with('rcalist',$rcalist);
}


public function addrca(Request $request)
{
     $rcaname = $request->rcaname;
     $category_name = $request->category_name;
        $Process_rca = new Process_rca;
        $Process_rca->rca_name = $rcaname;
        $Process_rca->category_name  = $category_name;
        $Process_rca->save();


     if($Process_rca)
     { 
        $arr = array('msg' => 'Successfully Add', 'status' => true);
     }else{

        $arr = array('msg' => 'Please try again later', 'status' =>false);
     }

      return response()->json($arr);  
}

  public function delrca($id)
   {
     Process_rca::find($id)->delete();
     
     return redirect('/admin/rca'); 
   }

   public function calendar(Request $request)
   {
    $Calendartbl = Calendartbl::select('*')->get(); 
    return view('/admin/calendar')->with('Calendartbl',$Calendartbl); 
   }
   
    public function add_leave_listcal(Request $request)
    {
      $title=$request->title;
      $To_holiday=$request->To_holiday;
      $From_holiday=$request->From_holiday;
      $Weekday=$request->Weekday;
      $array = array();
      $Variable1 = strtotime($To_holiday); 
      $Variable2 = strtotime($From_holiday); 
     for ($currentDate = $Variable1; $currentDate <= $Variable2; $currentDate += (86400))
      { 
         $Store = date('Y-m-d', $currentDate); 
         $array2= date('D', $currentDate);
         $array[$array2][] = $Store; 
      }

foreach ($Weekday as $key1 => $value1) 
{

 //foreach ($array[$value1] as $key => $value)
  //{
    
    $start=date('Y-m-d h:i:s', strtotime($value1));
    $end=date('Y-m-d h:i:s', strtotime($value1));
    $day=date('D', strtotime($value1));
    
        $Calendartbl = new Calendartbl;
        $Calendartbl->title = $title;
        $Calendartbl->start  = $start;
        $Calendartbl->end  = $end;
        $Calendartbl->day  = $day;
        $Calendartbl->save();
    //}
}
      $arr = array(
            "msg" => 'Holiday Add to successfully',
            "response_code" => '201'
            
        );
    return response()->json($arr); 
    }

    public function fetch_event(Request $request)
    {
     //echo 'sunil';die;

       $Calendartbl = Calendartbl::select('*')->orderBy('id', 'DESC')->get();
       $eventArray = array();
       //print_r($Calendartbl);die;
       foreach($Calendartbl as $key => $Calendartbls)
       {
          array_push($eventArray, $Calendartbls);
       }
       print_r($eventArray);
       //return response()->json($eventArray);
    }
    public function add_event(Request $request)
    { 
      $title = isset($request->title) ? $request->title : "";
      $start = isset($request->start) ? $request->start : "";
      $end = isset($request->end) ? $request->end : "";
        $Calendartbl = new Calendartbl;
        $Calendartbl->title = $title;
        $Calendartbl->start  = $start;
        $Calendartbl->end  = $end;
        //$Calendartbl->day  = $day;
        $Calendartbl->save();

         $arr = array(
            "msg" => 'Holiday Add to successfully',
            "response_code" => '201'
            
        );
    return response()->json($arr); 
    }


    public function status_sub_edit(Request $request)
    {

      $id=$request->id;
      $Status = Status::find($id);
      $status=$Status->status;
      $sub_status=$Status->sub_status;
      $arr = array(
            'id' => $id,
            'sub_status' => $sub_status
            
        );
      
      return response()->json($arr);  
      
    }

  public function substatus_edit(Request $request)
  {
    $id=$request->editid;
    $status=$request->status;
    $sub_status=$request->sub_status;
    $updatestatus = Status::where('id','=',$id)->update(['status'=>$status,'sub_status'=>$sub_status]);

        if($updatestatus){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr);
  }

public function departments_edit(Request $request)
{
      $id=$request->id;
      $Department = Department::find($id);
      $department_name=$Department->department_name;
    
      $arr = array(
            'id' => $id,
            'department_name' => $department_name
          );
      return response()->json($arr);
}

public function departments_update(Request $request)
{
    $id=$request->edit_id;
    $department_name=$request->department_name;
    
    $updatedepartment = Department::where('id','=',$id)->update(['department_name'=>$department_name]);

        if($updatedepartment){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr);
}

public function rca_edit(Request $request)
{
      $id=$request->id;
      $Process_rca = Process_rca::find($id);
      $rca_name=$Process_rca->rca_name;
      $category_name=$Process_rca->category_name; 
      $arr = array(
            'id' => $id,
            'rca_name' => $rca_name,
            'category_name' => $category_name
          );
      return response()->json($arr); 
}

public function rca_update(Request $request)
{
    $id=$request->edit_id;
    $rcaname=$request->rcaname;
    $category_name=$request->category_name;
    
    $updaterca = Process_rca::where('id','=',$id)->update(['rca_name'=>$rcaname]);

        if($updaterca){
           $arr = array("msg" => 'Successfull Update');
        }else{
           $arr = array("msg" => 'UnSuccessfull Update');
        }
        return response()->json($arr); 
}

public function dataget_substatus(Request $request)
{
  $action=$request->action;
  $status=$request->status;
  $process=$request->process;
  if($action=='selcted')
  {
    $html='';
    $substatus = Status::select('*')->where('process_name','=',$process)->where('status','=',$status)->get();
   ///echo count($substatus);
    foreach ($substatus as  $substatuss) 
    {
     $sub_status=$substatuss->sub_status;
     $html.='<option value="'.$sub_status.'">'.$sub_status.'</option>';
    }
    echo $html;
   }

}

public function ticket_addremark(Request $request)
{
  
 $action=$request->action;
 
 $Ticket_number=$request->Ticket_number;
 if($action=='addremark')
 {
 
 $Ticketdetail = Ticket::select('*')->where('ticket_number','=',$Ticket_number)->get();
      foreach ($Ticketdetail as $key => $Tickets) 
       {
         $status=$request->status;
         $substatus=$request->substatus;
         $feedback=$request->feedback;
         $process_name=$request->process_name;
         $customer_id=$request->customer_id;

         $customer_name=$Tickets->customer_name;
         $ticket_number=$Tickets->ticket_number;
         $email_id=$Tickets->email_id;
          //////////////////////////////////////////////////////
          $status_f=$Tickets->status;
          $sub_status_f=$Tickets->sub_status;
          $owner_f=$Tickets->owner;
       //echo $status_f .'|'. $sub_status_f .'|'. $owner_f;die;
       $update_ticket = Ticket::where('ticket_number','=',$Ticket_number)->update(['status'=>$status,'sub_status'=>$substatus]);
       
       $system_remark='This ticket status changed by '.Auth::user()->name.'. Status changed from '.$status_f.' to '.$status;
       $case_status='Ticket status changed';
       $Ticket_number=$request->Ticket_number;
       $feadback=$request->feedback;
       $owner=$owner_f;

        $Log = new Log;
        $Log->ticket_number = $Ticket_number;
        $Log->process_name = 'HISTORY';
        $Log->system_remark = $system_remark;
        $Log->case_status = $case_status;
        $Log->feadback = $feadback;
        $Log->user_id = Auth::user()->id;
        $Log->user_name = Auth::user()->name;
        $Log->status = $status;
        $Log->owner = $owner;
        $Log->sub_status = $substatus;
        $Log->save();
        
         $datasend = array(
                 'customer_name' => $customer_name, 
                 'email_id'=> $email_id,
                 'ticket_number' => $ticket_number,
                 'status' => $status_f,
                 'sub_status' => $sub_status_f,
                 'feadback' => $feadback
                );

            Mail::to($email_id)->send(new Activity($datasend));
            $arr = array(
            "message" => 'Status change successfully',
            "response_code" => '3001',
            "heading" => 'Status change successfully',
            "text" => 's',
            "icon" => 'success'
             );

       }

          echo json_encode($arr);
    }
  }

public function ticket_addnote(Request $request)
{
 $action=$request->action; 
 $process_name=$request->process_name;
 $strik_note=$request->strik_note;
 $Ticket_number=$request->Ticket_number; 

 

     if($action =='addnote')
     {
        //echo $process_name .'|'.$strik_note.'|'.$Ticket_number;die();

            $Note = new Note();
            $Note->process_name = $process_name;
            $Note->ticket_number =$Ticket_number;
            $Note->note_text = $strik_note;
            $Note->save();

            $arr = array(
            "msg" => 'Add Note Successfully',
            "response_code" => '3001',
            "heading" => 'Add Note successfully'
            );
     }

     echo json_encode($arr);
}

public function ticket_addtask(Request $request)
{
 $action=$request->action; 
 $title=$request->title;
 $description=$request->description;
 $date1=$request->date1;
 $time1=$request->time1;
 $process_name=$request->process_name;
 $Ticket_number=$request->Ticket_number;
 $assign=$request->assign;
 $created=$request->created;

 //echo $action .'|'. $title .'|'. $description .'|'. $date1 .'|'. $time1 .'|'. $process_name .'|'. $Ticket_number;
 
  if($action =='addtask')
     {
        
            $Task = new Task;
            $Task->ticket_number = $Ticket_number;
            $Task->process_name = $process_name;
            $Task->title = $title;
            $Task->description = $description;
            //$Task->date1 = $date1;
            //$Task->time1 = $time1;
            $Task->owner = $assign;
            $Task->createdby = $created;
            $Task->save();

            $arr = array(
            "msg" => 'Add Task Successfully',
            "response_code" => '3001',
            "heading" => 'Add Note successfully'
            );
     }

     echo json_encode($arr); 
 

}

public function viewallnotification(Request $request)
{
  $user_name=Auth::user()->name;
  $processstatus = DB::table('process_log')->select('*')
                                    ->where('user_name','=',$user_name)
                                    ->orwhere('owner','=',$user_name)
                                    ->orderBy('id', 'DESC')->get();
 return view('/admin/viewallnotification')->with('processstatus',$processstatus);

}

public function specialuserlist()
{
    return view('/admin/specialuserlist');//->with('processstatus',$processstatus);
}

public function getspecialuserlist(){
      
      $usersQuery = User::query();
      
      $users = $usersQuery->select('id','name','email','user_type','images','department_name','user_id')->where('user_type', 'TL')->orderBy('id', 'DESC');
    
        return datatables()->of($users) 
             ->addColumn('checkbox', function($data){
                 
                      return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="'.$data->user_id.'"    name="chk[]" />';
                 
              })

            ->addColumn('action', function($users){
              $viewUrl = url('/admin/userscontrol/'.$users->user_id);
              $delUrl = url('/admin/specialusersdel/'.$users->id);
                   $btn = '<a href="'.$viewUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="fa fa-eye" aria-hidden="true" title="View"></i></a>&nbsp;&nbsp;';
                   $btn.='<a href="'.$delUrl.'" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="far fa-trash-alt"></i></a>';
                   return $btn;
            })
            ->rawColumns(['checkbox','action']) 
            ->make(true); 

    }

    public function createspecialemployee(Request $request)
    {

      //$data=$request->all();
      //print_r($data);;
      //die();
        
      $user_name=$request->user_name;
      $user_email=$request->user_email;
      $user_pass=$request->user_pass;
      $user_type=$request->user_type;
      $department_name=$request->department_name;
      $Process_name=$request->Process_name;
      $token=$request->_token;
      $user_id=mt_rand(00000,99999);
      $usercheck = User::select('*')->where('email','=',$user_email)->get();
      //if($Licenses_limit>$count_licenses){
      if(count($usercheck) == 0){
       
        $user = new User;
        $user->Process_name = $Process_name;
        $user->user_id = $user_id;
        $user->name = $user_name;
        $user->email  = $user_email;
        $user->password = Hash::make($user_pass);
        //$user->password = $user_pass;
        $user->user_type = $user_type;
        $user->department_name = $department_name;
        $user->remember_token = $token;
        $user->chat_status = 'Offline';
        $user->status_live = 'success';
        $user->Process_name = 'Ticket';
        $user->status = '1';
        $user->save();
         
       $arr = array(
            "msg" => 'add successfully',
            "response_code" => '3001',
            );

      }else{

        $arr = array(
            "msg" => 'Already add',
            "response_code" => '2001',
            );
    }
    return response()->json($arr);
     
    }
   
  public function specialusersdel(Request $request)
    {
       $id = $request->id;
        User::where('id',$id)->delete();
     
     return redirect('/admin/specialuser')->with('flash_message_success','Successfull Delete'); 
    }

}
