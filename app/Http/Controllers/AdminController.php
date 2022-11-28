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
use App\Models\User;
use App\Models\Ticket;
use App\Models\Categorysub;
use App\Models\Status;
use App\Models\Product;
use App\Models\Department;
use App\Models\Logfiles;
use App\Models\Processlist;
use App\Models\Tablefleldlist;
use App\Models\Process_rca;
use App\Models\Calendartbl;
use App\Models\Customer;
use App\Models\Note;
use App\Models\Task;
use App\Models\Sess;
use App\Models\Userrole;
use App\Models\subcategory;
use App\Models\Permissionlist;
use App\Models\Designation;
use App\Models\Userhistory;
use App\Models\Chat;
use App\Models\Email;
use App\Models\Document;
use App\Models\New_status;
use App\Models\Eaccess;
use App\Models\Config;
use Carbon\Carbon;
use App\Mail\Assign;
use App\Mail\CloseTicket;
use App\Mail\Tatdelivery;
use App\Mail\Activity;
use App\Mail\Userresetpassword;
use File;
use App\Mail\CustomerMail;
use App\Models\Email_attachment;
use App\Models\Email_cc;

use App\Exports\TicketReport;
//use App\Imports\TicketReport;
use Maatwebsite\Excel\Facades\Excel;
use App\Mail\MyTestMail;


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
    public function user()
    {
        if (session()->has("datas")) {

           
            return redirect("/user/dashboard");
        } else {
            return view("admin.userlogin");
        }
    }
    public function userlogin(Request $request)
    {
        if ($request->isMethod("post")) {
            $data = $request->input();
            //print_r($data);die();
            $username = $data["username"];
            $password = $data["password"];

            if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
                //user sent their email
                //Auth::attempt(['email' => $username, 'password' => $password,'status' => '1']);
                if (
                    Auth::attempt([
                        "email" => $data["username"],
                        "password" => $data["password"],
                        "status" => "1",
                    ])
                ) {
                    $request->session()->put("datas", $request->input());
                    if (
                        Auth::user()->user_type != "Admin" &&
                        Auth::user()->user_type != "customer"
                    ) {
                        $User = User::select("id", "name", "password_status")
                            ->where("user_type", "!=", "Admin")
                            ->where("user_type", "!=", "customer")
                            ->where("id", "=", Auth::user()->id)
                            ->first();
                        if ($User["password_status"] == 0) {
                            return redirect("/user/setnewpassword");
                        } else {
                            $ip_address = request()->ip();
                            $dt = date("Y-m-d");
                            $updateuser = User::where(
                                "id",
                                "=",
                                $User["id"]
                            )->update([
                                "ip_address" => $ip_address,
                                "session_in" => Carbon::now()->toDateTimeString(),
                                "login_status" => "1",
                            ]);

                            $Userhistorycheck = Userhistory::select("*")
                                ->where("uid", "=", Auth::user()->id)
                                ->where("session_in_date", "=", $dt)
                                ->get();
                            if (count($Userhistorycheck) == 0) {
                                $userhistory = new Userhistory();
                                $userhistory->uid = Auth::user()->id;
                                $userhistory->name = Auth::user()->name;
                                $userhistory->ip_address = $ip_address;
                                $userhistory->session_in = Carbon::now()->toDateTimeString();
                                $userhistory->session_in_date = $dt;
                                $userhistory->save();
                            }
                            return redirect("/user/dashboard");
                        }
                    } else {
                        Auth::logout();
                        Session::flush();
                        return redirect("/user")->with(
                            "flash_message_error",
                            "Only User authorised access"
                        );
                    }
                } else {
                    return redirect("/user")->with(
                        "flash_message_error",
                        "Wrong User id & Password!"
                    );
                }
            } else {
                if (
                    Auth::attempt([
                        "username" => $data["username"],
                        "password" => $data["password"],
                        "status" => "1",
                    ])
                ) {
                    $request->session()->put("datas", $request->input());
                    if (
                        Auth::user()->user_type != "Admin" &&
                        Auth::user()->user_type != "customer"
                    ) {
                        $User = User::select("id", "name", "password_status")
                            ->where("user_type", "!=", "Admin")
                            ->where("user_type", "!=", "customer")
                            ->where("id", "=", Auth::user()->id)
                            ->first();
                        if ($User["password_status"] == 0) {
                            return redirect("/user/setnewpassword");
                        } else {
                            $ip_address = request()->ip();
                            $dt = date("Y-m-d");
                            $updateuser = User::where(
                                "id",
                                "=",
                                $User["id"]
                            )->update([
                                "ip_address" => $ip_address,
                                "session_in" => Carbon::now()->toDateTimeString(),
                                "login_status" => "1",
                            ]);

                            $Userhistorycheck = Userhistory::select("*")
                                ->where("uid", "=", Auth::user()->id)
                                ->where("session_in_date", "=", $dt)
                                ->get();
                            if (count($Userhistorycheck) == 0) {
                                $userhistory = new Userhistory();
                                $userhistory->uid = Auth::user()->id;
                                $userhistory->name = Auth::user()->name;
                                $userhistory->ip_address = $ip_address;
                                $userhistory->session_in = Carbon::now()->toDateTimeString();
                                $userhistory->session_in_date = $dt;
                                $userhistory->save();
                            }
                            return redirect("/user/dashboard");
                        }
                    } else {
                        Auth::logout();
                        Session::flush();
                        return redirect("/user")->with(
                            "flash_message_error",
                            "Only User authorised access"
                        );
                    }
                } else {
                    return redirect("/user")->with(
                        "flash_message_error",
                        "Wrong User id & Password!"
                    );
                }
            }

            /*die();
            
            if (Auth::attempt(['email' => $data['username'], 'password' => $data['password'],'status' => '1'])) 
            {
                $request->session()->put('datas', $request->input());
                    if(Auth::user()->user_type != 'Admin'){
                        $User=User::select('id','name','password_status')->where('user_type','!=','Admin')->where('user_type','!=','customer')->where('id','=',Auth::user()->id)->first();  
                    if($User['password_status'] == 0){
                      return redirect('/user/setnewpassword'); 
                      }else{
                      return redirect('/user/dashboard');
                      }
                      
                    }else{
                        Auth::logout();
                        Session::flush();
                      return redirect('/user')->with('flash_message_error','Only User authorised access');   
                    }
              
             }else{
                 return redirect('/user')->with('flash_message_error','Wrong User id & Password!');
             }*/
        }
    }

    public function login(Request $request)
    {
        if (session()->has("datas")) {
            return redirect("/admin/dashboard");
        } else {
            return view("admin.login");
        }
    }

    public function admin(Request $request)
    {
        if ($request->isMethod("post")) {
            $data = $request->input();
            //print_r($data);die();

            if (
                Auth::attempt([
                    "email" => $data["username"],
                    "password" => $data["password"],
                    "status" => "1",
                ])
            ) {
                $request->session()->put("datas", $request->input());
                if (Auth::user()->user_type == "Admin") {
                    $User = User::select("id", "name", "password_status")
                        ->where("user_type", "!=", "customer")
                        ->where("id", "=", Auth::user()->id)
                        ->first();
                    //if($User['password_status'] == 0){
                    //return redirect('/admin/setnewpassword');
                    //}else{
                    $ip_address = request()->ip();
                    $updateuser = User::where("id", "=", $User["id"])->update([
                        "ip_address" => $ip_address,
                        "session_in" => Carbon::now()->toDateTimeString(),
                        "login_status" => "1",
                    ]);
                    return redirect("/admin/dashboard");
                    //}
                } else {
                    Auth::logout();
                    Session::flush();
                    return redirect("/admin")->with(
                        "flash_message_error",
                        "Only Admin authorised access!"
                    );
                }
            } else {
                return redirect("/admin")->with(
                    "flash_message_error",
                    "Wrong User id & Password!"
                );
            }
        }
    }

    /* public function admin(Request $request){
         $data = $request->input();
         //echo $data['user'];die();
         if($data['user'] == 'admin')
            {
            //the input field has name='username' in form
            $username = $data['username']; 
            $password = $data['password'];
            date_default_timezone_set('Asia/Kolkata');
            $dt=date("YmdHis");
            if(filter_var($username, FILTER_VALIDATE_EMAIL)) {
                //user sent their email 
                Auth::attempt(['email' => $username, 'password' => $password,'status' => '1']);
            } else {
                //they sent their username instead 
                Auth::attempt(['username' => $username, 'password' => $password,'status' => '1']);
            }
           
            //was any of those correct ?
            if ( Auth::check() ) {
                //send them where they are going 
                
                $request->session()->put('datas', $data);
            
                if($request->session()->has('datas'))
                  {
                    //echo Auth::user()->user_type;die();   

                    if(Auth::user()->user_type == 'Admin'){
                      return redirect('/admin/dashboard');      
                    }else{
                        Auth::logout();
                        Session::flush();
                      return redirect('/admin')->with('flash_message_error','Only Admin authorised access');   
                    }
                   
                  }
                
            }else{
               return redirect('/admin')->with('flash_message_error','Invalid Username or Password');      
             
            } 
             }else{
             //the input field has name='username' in form


            $username = $data['username']; 
            $password = $data['password'];
            date_default_timezone_set('Asia/Kolkata');
            $dt=date("YmdHis");
            if(filter_var($username, FILTER_VALIDATE_EMAIL)) {
                //user sent their email 
                Auth::attempt(['email' => $username, 'password' => $password,'status' => '1']);
            } else {
                //they sent their username instead 
                Auth::attempt(['username' => $username, 'password' => $password,'status' => '1']);
            }
           
            //was any of those correct ?
            if ( Auth::check() ) {
                //send them where they are going 
                
                $request->session()->put('datas', $data);
            
                if($request->session()->has('datas'))
                  {
                //echo Auth::user()->user_type;die();   

                    if(Auth::user()->user_type == 'Employee'){
                    $User=User::select('id','name','password_status')->where('user_type','=','Employee')->where('user_type','!=','customer')->where('id','=',Auth::user()->id)->first();  
                    if($User['password_status'] == 0){
                      ///echo "sunil";
                      return redirect('/user/setnewpassword'); 
                      }else{
                      return redirect('/user/dashboard');
                      }      
                    }else{
                        Auth::logout();
                        Session::flush();
                      return redirect('/admin')->with('flash_message_error','Only User authorised access');   
                    }
                   
                  }
                
            }else{
               return redirect('/admin')->with('flash_message_error','Invalid Username or Password');      
             
            }
            } */

    /* if($request->isMethod('post')){
          
            //the input field has name='username' in form
            $username = $data['username']; 
            $password = $data['password'];
            date_default_timezone_set('Asia/Kolkata');
            $dt=date("YmdHis");
            if(filter_var($username, FILTER_VALIDATE_EMAIL)) {
                //user sent their email 
                Auth::attempt(['email' => $username, 'password' => $password,'status' => '1']);
            } else {
                //they sent their username instead 
                Auth::attempt(['username' => $username, 'password' => $password,'status' => '1']);
            }
           
            //was any of those correct ?
            if ( Auth::check() ) {
                //send them where they are going 
                
                $request->session()->put('datas', $data);
            
                if($request->session()->has('datas'))
                  {
                    //echo Auth::user()->user_type;die();   

                    if(Auth::user()->user_type == 'Admin'){
                      return redirect('/admin/dashboard');      
                    }else{
                        Auth::logout();
                        Session::flush();
                      return redirect('/admin')->with('flash_message_error','Only Admin authorised access');   
                    }
                   
                  }
                
            }else{
               return redirect('/admin')->with('flash_message_error','Invalid Username or Password');      
             
            }  
          
         }*/
    /*  if(session()->has('datas')){
           return redirect('/admin/dashboard');
         }else{
        return view('admin.login');
        }*/

    /*}*/

    /*  public function admin(Request $request){

        if($request->isMethod('post')){
            $title = 'Dashboard';
            $data = $request->input();

            //print_r($data);die();

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

    /*public function admin(Request $request){
            
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
   
          if($min > 60 && $min!='')
          {
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
*/
    /*public function supportlogin(Request $request)
 {
    if($request->isMethod('post')){
            $data = $request->input();
            //the input field has name='username' in form
            $username = $data['username']; 
            $password = $data['password'];
            date_default_timezone_set('Asia/Kolkata');
            $dt=date("YmdHis");
            if(filter_var($username, FILTER_VALIDATE_EMAIL)) {
                //user sent their email 
                Auth::attempt(['email' => $username, 'password' => $password,'status' => '1']);
            } else {
                //they sent their username instead 
                Auth::attempt(['username' => $username, 'password' => $password,'status' => '1']);
            }
           
            //was any of those correct ?
            if ( Auth::check() ) {
                //send them where they are going 
                
                $request->session()->put('datas', $data);
                if($request->session()->has('datas'))
                  {
                if(Auth::user()->user_type == 'Employee'){
                    $User=User::select('id','name','password_status')->where('user_type','=','Employee')->where('user_type','!=','customer')->where('id','=',Auth::user()->id)->first();  
                    if($User['password_status'] == 0){
                      ///echo "sunil";
                      return redirect('/user/setnewpassword'); 
                      }else{
                      return redirect('/user/dashboard');
                      }      
                    }else{
                        Auth::logout();
                        Session::flush();
                      return redirect('/user')->with('flash_message_error','Only User authorised access');   
                    }
                   
                  }
                
            }else{
                
                      return redirect('/user')->with('flash_message_error','Invalid Username or Password');
            }  

         }
        if(session()->has('datas')){
           return redirect('/user/dashboard');
         }else{
        return view('admin.userlogin');
        }   
     
 }*/

    public function create_roles(Request $request)
    {
        $data = $request->all();

        $Userrole = new Userrole();
        $Userrole->user_role = $data["user_roles"];
        $Userrole->save();

        if ($Userrole) {
            $arr = ["msg" => "Successfull Add"];
        } else {
            $arr = ["msg" => "UnSuccessfull Add"];
        }
        return response()->json($arr);
    }

    public function get_datetime(Request $request)
    {
        $currdt = date("Y-m-d");
        //'ticket_number','customer_id','customer_name','del_date_tat','del_time_tat'
        $delivery_time = Ticket::select(
            "ticket_number",
            "customer_id",
            "customer_name",
            "del_date_tat",
            "del_time_tat"
        )
            ->where("status", "!=", "Closed")
            ->Where("del_date_tat", "=", $currdt)
            ->Where("del_time_tat", "!=", "")
            ->Where("owner", "=", Auth::user()->name)
            ->get();
        //echo $delivery_time;die();
        //return count($delivery_time);die();
        if (count($delivery_time) > 0) {
            $userData["data"] = $delivery_time;
            echo json_encode($userData);
            exit();
        }
    }

    public function logout()
    {
        //$user = Auth::user();
        // logout user
        //$userToLogout = User::find(5);
        //Auth::setUser($userToLogout);
        if (Auth::user()->user_type == "Admin") {
            if (empty(Auth::user()->id)) {
                $updateuser = User::where("id", "=", Auth::user()->id)->update([
                    "session_out" => Carbon::now()->toDateTimeString(),
                    "login_status" => "0",
                ]);
                Auth::logout();
                Session::flush();
                return redirect("/admin")->with([
                    "flash_message_success" => "Logged out Successfully",
                    "user" => "admin",
                ]);
            } else {
                Sess::where("session_id", Auth::user()->id)
                    ->where("last_activity", 1)
                    ->delete();
                $updateuser = User::where("id", "=", Auth::user()->id)->update([
                    "session_out" => Carbon::now()->toDateTimeString(),
                    "login_status" => "0",
                ]);
                Auth::logout();
                Session::flush();
                return redirect("/admin")->with([
                    "flash_message_success" => "Logged out Successfully",
                    "user" => "admin",
                ]);
            }
        } else {
            if (empty(Auth::user()->id)) {
                //Sess::where('session_id', Auth::user()->id)->where('last_activity', 1)->delete();
                $dt = date("Y-m-d");
                $updateuser = User::where("id", "=", Auth::user()->id)->update([
                    "session_out" => Carbon::now()->toDateTimeString(),
                    "login_status" => "0",
                ]);

                $updateuserhistory = Userhistory::where("session_in_date", $dt)
                    ->where("uid", "=", Auth::user()->id)
                    ->update([
                        "session_out" => Carbon::now()->toDateTimeString(),
                    ]);
                Auth::logout();
                Session::flush();
                return redirect("/user")->with([
                    "flash_message_success" => "Logged out Successfully",
                    "user" => "user",
                ]);
            } else {
                //Sess::where('session_id', Auth::user()->id)->where('last_activity', 1)->delete();
                $dt = date("Y-m-d");
                $updateuser = User::where("id", "=", Auth::user()->id)->update([
                    "session_out" => Carbon::now()->toDateTimeString(),
                    "login_status" => "0",
                ]);

                $updateuserhistory = Userhistory::where("session_in_date", $dt)
                    ->where("uid", "=", Auth::user()->id)
                    ->update([
                        "session_out" => Carbon::now()->toDateTimeString(),
                    ]);
                Auth::logout();
                Session::flush();
                return redirect("/user")->with([
                    "flash_message_success" => "Logged out Successfully",
                    "user" => "user",
                ]);
            }
        }
    }
    public function dashboard()
    {
        if (session()->has("datas")) {
            //echo Auth::user()->id;
            //echo Auth::user()->name;die;
            $user = User::all();
            return view("/admin/dashboard")->with("user", $user);
        } else {
            session()->forget("datas");
            return redirect("/admin")->with(
                "flash_message_error",
                "Please login to access"
            );
        }
    }

    public function addtat(Request $request)
    {
        date_default_timezone_set("Asia/Kolkata"); // change according timezone
        $data = $request->input();
        $time = date("h:i A", strtotime($data["delivery_time"]));
        //echo date($data['delivery_time'],time()); //$data['delivery_time'];
        //die();
        $email = $data["emaildelivery"];
        $updateticket = Ticket::where("id", "=", $data["ticketid"])->update([
            "del_date_tat" => $data["delivery_date"],
            "del_time_tat" => $time,
            "del_comm_tat" => $data["deliver_comment"],
        ]);

        $datasend = [
            "customer_name_delivery" => $data["customer_name_delivery"],
            "emaildelivery" => $data["emaildelivery"],
            "ticket_number" => $data["ticket_number"],
            "delivery_date" => $data["delivery_date"],
            "delivery_time" => $data["delivery_time"],
            "deliver_comment" => $data["deliver_comment"],
        ];

        //Mail::to($email)->send(new Tatdelivery($datasend));

        /*$result = array(
            "message" => 'Ticket Closed to successfully',
            "response_code" => '201',
            "heading" => 'Ticket Closed to successfully',
            "text" => 'Closed the ticket',
            "icon" => 'success'
             );*/

        return redirect(
            "/admin/ManagesTicketdetails/" . $data["ticketid"]
        )->with("success", "Successfully Add!");
    }

    public function sendsms(Request $request)
    {
        $data = $request->all();

        $port_id = 0;
        $i = 1;

        $json_string_data =
            '{"text":"' .
            $data["comment"] .
            '","param":[{"number":"' .
            $data["mobileno"] .
            '","text_param":"new","user_id":"' .
            $i .
            '"}],"port":[' .
            $port_id .
            "]}";
        //$gateway_ip = "122.161.195.61";
        $username = "admin";
        $password = "xspl@123";
        $ch = curl_init("http://192.168.1.211/api/send_sms");
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json_string_data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Content-Type: application/json",
            "version: 1.0.2",
            "Content-Length: " . strlen($json_string_data),
        ]);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $result = curl_exec($ch);

        curl_close($ch);
        $response_array = json_decode($result, true);

        //return $response_array;die();

        $status_code = $response_array["error_code"];

        if ($status_code == 202) {
            return redirect(
                "/admin/ManagesTicketdetails/" . $data["ticketid"]
            )->with("success", "Successfully Send Messages!");
        } else {
            return redirect(
                "/admin/ManagesTicketdetails/" . $data["ticketid"]
            )->with("error", "error some Messages!");
        }
    }

    public function addticket(Request $request)
    {

        //$ct_TKT_new=$request->ct_TKT;
        $mobile = $request->mob;

        return view("/admin/addticket")->with("mobile",$mobile);
    }
    public function ticketListview()
    {
        //echo $role=Auth::user()->user_typedie();
        if (Auth::user()->user_type == "Admin") {
            return view("admin/ticketlist");
        } else {
            return view("admin/ticketlist");
        }
    }

    public function getTicketlist()
    {
        date_default_timezone_set("Asia/Kolkata");
        $usersQuery = Ticket::query();
        $role = Auth::user()->user_type;
        $owner_name_assign = Auth::user()->name;
        $ticket_search = !empty($_GET["ticket_search"])
            ? $_GET["ticket_search"]
            : "";
        $status_tb = !empty($_GET["status_tb"]) ? $_GET["status_tb"] : "";
        $Source_tb = !empty($_GET["Source_tb"]) ? $_GET["Source_tb"] : "";
        $user_name = !empty($_GET["user_name"]) ? $_GET["user_name"] : "";
        $department = !empty($_GET["department"]) ? $_GET["department"] : "";
        $category_name = !empty($_GET["category_name_tb"])
            ? $_GET["category_name_tb"]
            : "";

        if ($ticket_search) {
            $usersQuery->whereRaw(
                "(process_ticket.ticket_number) = '" . $ticket_search . "' "
            );
            //}else if($ticket_search){
            //$usersQuery->whereRaw("(process_ticket.task) = '" . $ticket_search . "' ");
        } elseif ($status_tb) {
            $usersQuery->whereRaw(
                "(process_ticket.status) = '" . $status_tb . "' "
            );
        } elseif ($Source_tb) {
            $usersQuery->whereRaw(
                "(process_ticket.source) = '" . $Source_tb . "' "
            );
        } elseif ($user_name) {
            $usersQuery->whereRaw(
                "(process_ticket.owner) = '" . $user_name . "' "
            );
        } elseif ($department) {
            $usersQuery->whereRaw(
                "(process_ticket.department) = '" . $department . "' "
            );
        } elseif ($category_name) {
            $usersQuery->whereRaw(
                "(process_ticket.category) = '" . $category_name . "' "
            );
        }
        if ($role == "Admin") {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "customer_id",
                    "task",
                    "subject",
                    "owner",
                    "created_by",
                    "created_date",
                    "status"
                )
                ->orderBy('created_date','DESC')

                //->orwhere('task','=', 'T')
                //->orderByRaw('FIELD( status,"New","Open","Working","Follow-up","Closed"), created_at DESC')
                ;
        } elseif (Auth::user()->type == "Special") {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "customer_id",
                    "task",
                    "subject",
                    "owner",
                    "created_by",
                    "created_date",
                    "status"
                )
                ->where("department", "=", Auth::user()->user_type)
                ->where("owner", "!=", "Admin")
                ->orderBy('updated_at','DESC')
                //->orwhere('task','=', 'T')
                //->orderByRaw(
                  //'FIELD( status,"New","Open","Working","Hold","Closed"), //updated_at DESC')
                ;
        } else {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "customer_id",
                    "task",
                    "subject",
                    "owner",
                    "created_by",
                    "created_date",
                    "status"
                )
                ->where("owner", "=", $owner_name_assign)
                ->orderBy('updated_at','DESC')
                //->orwhere('task','=', 'T')
                //->orderByRaw(
                    //'FIELD( status,"New","Open","Working","Hold","Closed"), //updated_at DESC'
                //)
                ;
        }

        return datatables()
            ->of($users)
            ->addColumn("checkbox", function ($data) {
                if ($data->status == "New") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show pl" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Open") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show pl" value="' .
                        $data->id .
                        '"    name="chk[]" />';
              
             
                } elseif ($data->status == "Follow-up") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show pl" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Closed") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show pl" value="' .
                        $data->id .
                        '" disabled="disabled"   name="chk[]" />';
                }
            })

            ->addColumn("action", function ($users) {
                if (Auth::user()->user_type == "Admin") {
                    $viewUrl = url("/admin/ManagesTicketdetails/" . $users->id);
                    $transferUrl = url("/admin/transfer/" . $users->id);
                } else {
                    $viewUrl = url("/user/ManagesTicketdetails/" . $users->id);
                    $transferUrl = url("/admin/transfer/" . $users->id);
                }
                $btn =
                    '<a href="' .
                    $viewUrl .
                    '" data-toggle="tooltip" data-original-title="View Ticket" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View Ticket"></i> </a>&nbsp;&nbsp;';
                if (Auth::user()->type == "Special") {
                    $btn .=
                        '<a href="javascript:void(0);"  title="Transfer Ticket" data-toggle="modal"  data-target="#transfer" id="' .
                        $users->id .
                        '" class="btn btn-xs btn-primary btn-sm ticket_transfer"><i class="fas fa-exchange-alt"></i></a>&nbsp;&nbsp;';
                    if ($users->task == "T") {
                        $btn .=
                            '<a href="' .
                            $viewUrl .
                            '"  title="Task"  id="' .
                            $users->id .
                            '" class="btn btn-xs btn-primary btn-sm ticket_transfer">' .
                            $users->task .
                            "</a>";
                    }
                }
                return $btn;
            })
             ->addColumn("customer", function ($users) {
                if (Auth::user()->user_type == "Admin") {
                $manageUrl = url("admin/Managescustomerdetails/" . $users->customer_id);
                } else {
                $manageUrl = url("user/Managescustomerdetails/" . $users->customer_id);
                }
                $btn =
                    '<a href="' .
                    $manageUrl .
                    '" data-toggle="tooltip" data-original-title="View Manage Ticket" >'.$users->customer_name.'</a>&nbsp;&nbsp;';    
                return $btn;
            }) 
            ->addColumn("status", function ($data) {
                if ($data->status == "New") {
                    return '<span style="color: #fff; font-weight: bold;padding: 4px 7px 5px 7px;border-radius: 6px;" class="btn-info" >New</span>';
                } elseif ($data->status == "Open") {
                    return '<span style="color: #fff; font-weight: bold;padding: 4px 7px 5px 7px;border-radius: 6px;" class="btn-danger" >Open</span>';
                
                } elseif ($data->status == "Follow-up") {
                    return '<span style="color: #fff; font-weight: bold;padding:4px 5px 5px 5px;border-radius: 6px;" class="btn-warning">Follow-up</span>';
                } elseif ($data->status == "Closed") {
                    return '<span style="color: #fff; font-weight: bold;padding: 4px 5px 5px 5px;border-radius: 6px;" class="btn-success" >Closed</span>';
                }
            })
            ->addColumn("created_date", function ($data) {
                $dt = date("d M Y", strtotime($data->created_date));
                $time = date("h:i A", strtotime($data->created_date));
                $time_ago = strtotime($data->created_at);
                //$startTime = Carbon::parse('2020-02-11 04:04:26');
                //$endTime = Carbon::parse('2020-02-11 04:36:56');

                //$totalDuration = $endTime->diffForHumans($startTime);
                //echo timeAgo($time_ago);
                $created_date =
                    '<b style="color:#800000;">' .
                    $dt .
                    "<br>" .
                    $time .
                    "</b>";
                return $created_date;
            })

            ->addColumn("subject", function ($data) {
                $subject = substr($data->subject, 0, 17);
                $subject =
                    '<a href="#" class="hasTooltip" style="color:#800000">' .
                    $subject .
                    "... <span>" .
                    $data->subject .
                    "</span></a>";
                return $subject;
            })
            ->addColumn("mobile", function ($data) {
                $mobile =
                    '<a href="tel:' .
                    $data->mobile .
                    '" class="hasTooltip" style="color:#800000">' .
                    $data->mobile .
                    "</a>";
                return $mobile;
            })

            ->rawColumns([
                "checkbox",
                "action",
                "customer",
                "status",
                "created_date",
                "subject",
                "mobile",
            ])
            ->make(true);
    }

    public function get_createdby()
    {
        //echo Auth::user()->name;die();
        return view("/admin/createdby");
    }

    public function get_createdby_Ticketlist()
    {
        $usersQuery = Ticket::query();
        $role = Auth::user()->user_type;
        $owner_name_assign = Auth::user()->name;
        $createdby = Auth::user()->id;

        //$ticket_search = (!empty($_GET["ticket_search"])) ? ($_GET["ticket_search"]) : ('');

        if ($role == "Admin") {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "subject",
                    "owner",
                    "created_by",
                    "status"
                )
                ->orderBy("id", "DESC");
        } elseif (Auth::user()->type == "Special") {
            ///$users = $usersQuery->select('id','ticket_number','mobile','customer_name','subject','owner','created_by','status')->where('department','=', Auth::user()->user_type)->where('owner','!=', 'Admin')->orderBy('id', 'DESC');
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "subject",
                    "owner",
                    "created_by",
                    "status"
                )
                ->where("created_by", "=", $owner_name_assign)
                ->orderBy("id", "DESC");
        } else {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "subject",
                    "owner",
                    "created_by",
                    "status"
                )
                ->where("created_by", "=", $owner_name_assign)
                ->orderBy("id", "DESC");
        }
        // echo $users;die();
        return datatables()
            ->of($users)

            ->addColumn("action", function ($users) {
                //if(Auth::user()->user_type=='Admin')
                //{
                $viewUrl = url("/admin/ManagesTicketdetails/" . $users->id);
                // $transferUrl = url('/admin/transfer/'.$users->id );
                //}else{
                //$viewUrl = url('/user/ManagesTicketdetails/'.$users->id );
                //$transferUrl = url('/admin/transfer/'.$users->id );
                //}
                $btn =
                    '<a href="' .
                    $viewUrl .
                    '" data-toggle="tooltip" data-original-title="View Ticket" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View Ticket"></i> </a>&nbsp;&nbsp;';
                /*if(Auth::user()->type=='Special')
                  { 
                   $btn .= '<a href="javascript:void(0);"  title="Transfer Ticket" data-toggle="modal"  data-target="#transfer" id="'.$users->id.'" class="btn btn-xs btn-primary btn-sm ticket_transfer"><i class="fas fa-exchange-alt"></i></a>';
                  } */
                return $btn;
            })
            ->addColumn("status", function ($data) {
                if ($data->status == "New") {
                    return '<span style="color:red;font-weight: bold;" >New</span>';
                } elseif ($data->status == "Open") {
                    return '<span style="color:red;font-weight: bold;" >Open</span>';
                
                } elseif ($data->status == "Follow-up") {
                    return '<span style="color:#00008b;font-weight: bold;">Follow-up</span>';
                } elseif ($data->status == "Closed") {
                    return '<span style="color:green;font-weight: bold;" >Closed</span>';
                }
            })
            ->rawColumns(["action", "status"])
            ->make(true);
    }

    public function ticketclosed(Request $request)
    {
        /*$id=$request->input('id');
         print_r($id);
         die();*/

        foreach ($request->input("id") as $key => $ticketid) {
            $fatch_email = Ticket::select("*")
                ->where("id", "=", $ticketid)
                ->first();

            $ticket_id = Ticket::find($ticketid);
            $ticket_id->status = "Closed";
            $ticket_id->sub_status = "Closed";
            $ticket_id->update();

            $ticket_number = $ticket_id->ticket_number;

            $system_remark =
                "The status has been closed by " . Auth::user()->name;
            $case_status = "Ticket closed";
            $feadback =
                Auth::user()->name .
                "Status changed from " .
                $ticket_id->status .
                " to Closed";
            $user_id = Auth::user()->id;
            $user_name = Auth::user()->name;
            $status = $ticket_id->status;
            $sub_status = $ticket_id->sub_status;
            $owner = $ticket_id->owner;
        }
        $Logfiles = new Logfiles();
        $Logfiles->ticket_number = $ticket_number;
        $Logfiles->process_name = "HISTORY";
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = "Ticket closed";
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $status;
        $Logfiles->owner = $owner;
        $Logfiles->sub_status = $sub_status;
        $Logfiles->save();

        $data = [
            "customer_name" => $fatch_email["customer_name"],
            "ticket_number" => $ticket_number,
            "system_remark" => $system_remark,
            "case_status" => $case_status,
            "feadback" => $feadback,
            "status" => $status,
        ];

        Mail::to($fatch_email["email_id"])->send(new CloseTicket($data));

        $result = [
            "message" => "Ticket Closed to successfully",
            "response_code" => "201",
            "heading" => "Ticket Closed to successfully",
            "text" => "Closed the ticket",
            "icon" => "success",
        ];

        return response()->json($result);
    }
    public function get_permission(Request $request)
    {
        $data = $request->all();
        $create_ticket_permission = "";
        $manage_ticket_permission = "";
        $create_customer_permission = "";
        $customer_list_permission = "";
        $knowledge_base_permission = "";
        $email_permission = "";
        $create_ticket_permission = "";
        $report_permission = "";
        $process_permission = "";
        $user_permission = "";
        $access_permission = "";
        $status_permission = "";
        $category_permission = "";
        $country_state_city_permission = "";
        $product_permission = "";
        $department_permission = "";
        $rca_permission = "";

        $users = Permissionlist::select(
            "uid",
            "group_name",
            "create_ticket_permission",
            "manage_ticket_permission",
            "create_customer_permission",
            "customer_list_permission",
            "knowledge_base_permission",
            "email_permission",
            "report_permission",
            "process_permission",
            "user_permission",
            "access_permission",
            "status_permission",
            "category_permission",
            "country_state_city_permission",
            "product_permission",
            "department_permission",
            "rca_permission"
        )
            ->where("group_name", "=", $data["user_role"])
            ->where("group_name", "!=", "")
            ->get();
        //echo 'sunil';die();
        if (count($users) > 0) {
            foreach ($users as $key => $value) {
                if ($value->create_ticket_permission == 1) {
                    $create_ticket_permission = "create_ticket_permission";
                } else {
                    $create_ticket_permission = 0;
                }
                if ($value->manage_ticket_permission == 1) {
                    $manage_ticket_permission = "manage_ticket_permission";
                } else {
                    $manage_ticket_permission = 0;
                }
                if ($value->create_customer_permission == 1) {
                    $create_customer_permission = "create_customer_permission";
                } else {
                    $create_customer_permission = 0;
                }
                if ($value->customer_list_permission == 1) {
                    $customer_list_permission = "customer_list_permission";
                } else {
                    $customer_list_permission = 0;
                }
                if ($value->knowledge_base_permission == 1) {
                    $knowledge_base_permission = "knowledge_base_permission";
                } else {
                    $knowledge_base_permission = 0;
                }
                if ($value->email_permission == 1) {
                    $email_permission = "email_permission";
                } else {
                    $email_permission = 0;
                }
                if ($value->report_permission == 1) {
                    $report_permission = "report_permission";
                } else {
                    $report_permission = 0;
                }
                if ($value->process_permission == 1) {
                    $process_permission = "process_permission";
                } else {
                    $process_permission = 0;
                }
                if ($value->user_permission == 1) {
                    $user_permission = "user_permission";
                } else {
                    $user_permission = 0;
                }
                if ($value->access_permission == 1) {
                    $access_permission = "access_permission";
                } else {
                    $access_permission = 0;
                }
                if ($value->status_permission == 1) {
                    $status_permission = "status_permission";
                } else {
                    $status_permission = 0;
                }
                if ($value->category_permission == 1) {
                    $category_permission = "category_permission";
                } else {
                    $category_permission = 0;
                }
                if ($value->country_state_city_permission == 1) {
                    $country_state_city_permission =
                        "country_state_city_permission";
                } else {
                    $country_state_city_permission = 0;
                }
                if ($value->product_permission == 1) {
                    $product_permission = "product_permission";
                } else {
                    $product_permission = 0;
                }
                if ($value->department_permission == 1) {
                    $department_permission = "department_permission";
                } else {
                    $department_permission = 0;
                }
                if ($value->rca_permission == 1) {
                    $rca_permission = "rca_permission";
                } else {
                    $rca_permission = 0;
                }
            }
        }
        $users = [
            "users" => $users,
            "create_ticket_permission" => $create_ticket_permission,
            "manage_ticket_permission" => $manage_ticket_permission,
            "create_customer_permission" => $create_customer_permission,
            "customer_list_permission" => $customer_list_permission,
            "knowledge_base_permission" => $knowledge_base_permission,
            "email_permission" => $email_permission,
            "create_ticket_permission" => $create_ticket_permission,
            "report_permission" => $report_permission,
            "process_permission" => $process_permission,
            "user_permission" => $user_permission,
            "access_permission" => $access_permission,
            "status_permission" => $status_permission,
            "category_permission" => $category_permission,
            "country_state_city_permission" => $country_state_city_permission,
            "product_permission" => $product_permission,
            "department_permission" => $department_permission,
            "rca_permission" => $rca_permission,
        ];

        return response()->json($users);
    }

    public function get_userpermission($id = null)
    {
        $User = User::select("id", "name", "department_name")
            ->where("user_type", "!=", "Admin")
            ->where("user_type", "!=", "customer")
            ->where("id", "!=", Auth::user()->id)
            ->get();

        if (!empty($id)) {
            $userperm = User::find($id);
        } else {
            $userperm = "";
        }
        //return view('/admin/userpermission')->with(['User'=> $User, 'userperm'=> $userperm,'id'=>$id] );
        return view("/admin/userpermission")->with([
            "User" => $User,
            "userperm" => $userperm,
            "id" => $id,
        ]);
    }

    public function update_userpermission(Request $request)
    {
        $data = $request->all();

        if (count($data) == 1) {
            $data["user_permission"] = "";
            $Permissionlist = Permissionlist::select("*")
                ->where("group_name", "=", $data["user_role"])
                ->get();
            if (count($Permissionlist) > 0) {
                $CreateTicket = 0;
                $ManageTicket = 0;
                $CreateCustomer = 0;
                $Customerlist = 0;
                $KnowledgeBase = 0;
                $Email = 0;
                $Report = 0;
                $Process = 0;
                $User = 0;
                $Permission = 0;
                $Status = 0;
                $Category = 0;
                $Country_State = 0;
                $Product = 0;
                $Department = 0;
                $RCA = 0;

                $updateuser = Permissionlist::where(
                    "group_name",
                    "=",
                    $data["user_role"]
                )->update([
                    "create_ticket_permission" => $CreateTicket,
                    "manage_ticket_permission" => $ManageTicket,
                    "create_customer_permission" => $CreateCustomer,
                    "customer_list_permission" => $Customerlist,
                    "knowledge_base_permission" => $KnowledgeBase,
                    "email_permission" => $Email,
                    "report_permission" => $Report,
                    "process_permission" => $Process,
                    "user_permission" => $User,
                    "access_permission" => $Permission,
                    "status_permission" => $Status,
                    "category_permission" => $Category,
                    "country_state_city_permission" => $Country_State,
                    "product_permission" => $Product,
                    "department_permission" => $Department,
                    "rca_permission" => $RCA,
                ]);
                return redirect("admin/userpermission")->with(
                    "error",
                    "You do not have assign any permission to this " .
                        $data["user_role"] .
                        "!"
                );
            } else {
                return redirect("admin/userpermission")->with(
                    "error",
                    "You do not have assign any permission to this " .
                        $data["user_role"] .
                        "!"
                );
            }
        } else {
            $CreateTicket = 0;
            $ManageTicket = 0;
            $CreateCustomer = 0;
            $Customerlist = 0;
            $KnowledgeBase = 0;
            $Email = 0;
            $Report = 0;
            $Process = 0;
            $User = 0;
            $Permission = 0;
            $Status = 0;
            $Category = 0;
            $Country_State = 0;
            $Product = 0;
            $Department = 0;
            $RCA = 0;
            //return redirect('admin/userpermission')->with('error', 'You do not have assign any permission to this '.$data['user_role'].'!');
            //echo '<pre>';
            //print_r($data);die();
            $Permissionlist = Permissionlist::select("*")
                ->where("group_name", "=", $data["user_role"])
                ->get();
            //echo count($Permissionlist);die();
            if (count($Permissionlist) > 0) {
                //echo $data['user_permission'];die();

                foreach ($data["user_permission"] as $key => $value) {
                    if ($value == "Create Ticket") {
                        $CreateTicket = 1;
                    } elseif ($value == "Manage Ticket") {
                        $ManageTicket = 1;
                    } elseif ($value == "Create Customer") {
                        $CreateCustomer = 1;
                    } elseif ($value == "Customer list") {
                        $Customerlist = 1;
                    } elseif ($value == "Knowledge Base") {
                        $KnowledgeBase = 1;
                    } elseif ($value == "Email") {
                        $Email = 1;
                    } elseif ($value == "Report") {
                        $Report = 1;
                    } elseif ($value == "Process") {
                        $Process = 1;
                    } elseif ($value == "User") {
                        $User = 1;
                    } elseif ($value == "Permission") {
                        $Permission = 1;
                    } elseif ($value == "Status") {
                        $Status = 1;
                    } elseif ($value == "Category") {
                        $Category = 1;
                    } elseif ($value == "Country & State, City") {
                        $Country_State = 1;
                    } elseif ($value == "Product") {
                        $Product = 1;
                    } elseif ($value == "Department") {
                        $Department = 1;
                    } elseif ($value == "RCA") {
                        $RCA = 1;
                    }
                }

                $changepermission = User::select("*")
                    ->where("user_type", "=", $data["user_role"])
                    ->where("type", "=", "Special")
                    ->where("type", "!=", "")
                    ->get();
                if (count($changepermission) > 0) {
                    foreach ($changepermission as $key => $changepermissions) {
                        //echo $CreateTicket .'|'. $ManageTicket .'|'. $CreateCustomer .'|'. $CreateTicket .'|'. $Customerlist .'|'. $KnowledgeBase .'|'. $Email .'|'. $Report .'|'. $Process .'|'. $User .'|'. $Permission.'|'. $Status.'|'. $Category.'|'. $Country_State.'|'. $Product.'|'. $Department.'|'. $RCA .'|'.$data['user_role'] .'|'. $changepermissions->type;

                        if ($changepermissions->type == "Special") {
                            $s_type = $changepermissions->type;
                            $permission = User::where(
                                "user_type",
                                "=",
                                $data["user_role"]
                            )
                                ->where("type", "=", $s_type)
                                ->update([
                                    "create_ticket_permission" => $CreateTicket,
                                    "manage_ticket_permission" => $ManageTicket,
                                    "create_customer_permission" => $CreateCustomer,
                                    "customer_list_permission" => $Customerlist,
                                    "knowledge_base_permission" => $KnowledgeBase,
                                    "email_permission" => $Email,
                                    "report_permission" => $Report,
                                    "process_permission" => $Process,
                                    "user_permission" => $User,
                                    "access_permission" => $Permission,
                                    "status_permission" => $Status,
                                    "category_permission" => $Category,
                                    "country_state_city_permission" => $Country_State,
                                    "product_permission" => $Product,
                                    "department_permission" => $Department,
                                    "rca_permission" => $RCA,
                                ]);
                        }
                    }
                }

                $updateuser = Permissionlist::where(
                    "group_name",
                    "=",
                    $data["user_role"]
                )->update([
                    "create_ticket_permission" => $CreateTicket,
                    "manage_ticket_permission" => $ManageTicket,
                    "create_customer_permission" => $CreateCustomer,
                    "customer_list_permission" => $Customerlist,
                    "knowledge_base_permission" => $KnowledgeBase,
                    "email_permission" => $Email,
                    "report_permission" => $Report,
                    "process_permission" => $Process,
                    "user_permission" => $User,
                    "access_permission" => $Permission,
                    "status_permission" => $Status,
                    "category_permission" => $Category,
                    "country_state_city_permission" => $Country_State,
                    "product_permission" => $Product,
                    "department_permission" => $Department,
                    "rca_permission" => $RCA,
                ]);
                //}
                if (Auth::user()->user_type == "Admin") {
                    return redirect("admin/userpermission")->with(
                        "success",
                        "Successfully Set User Permission!"
                    );
                } else {
                    return redirect("user/userpermission")->with(
                        "success",
                        "Successfully Set User Permission!"
                    );
                }
            } else {
                //foreach ($data['user_groups'] as $key => $usergroups) {
                //$data['user_permission'];
                //print_r($data);
                //die();
                foreach ($data["user_permission"] as $key => $value) {
                    if ($value == "Create Ticket") {
                        $CreateTicket = 1;
                    } elseif ($value == "Manage Ticket") {
                        $ManageTicket = 1;
                    } elseif ($value == "Create Customer") {
                        $CreateCustomer = 1;
                    } elseif ($value == "Customer list") {
                        $Customerlist = 1;
                    } elseif ($value == "Knowledge Base") {
                        $KnowledgeBase = 1;
                    } elseif ($value == "Email") {
                        $Email = 1;
                    } elseif ($value == "Report") {
                        $Report = 1;
                    } elseif ($value == "Process") {
                        $Process = 1;
                    } elseif ($value == "User") {
                        $User = 1;
                    } elseif ($value == "Permission") {
                        $Permission = 1;
                    } elseif ($value == "Status") {
                        $Status = 1;
                    } elseif ($value == "Category") {
                        $Category = 1;
                    } elseif ($value == "Country & State, City") {
                        $Country_State = 1;
                    } elseif ($value == "Product") {
                        $Product = 1;
                    } elseif ($value == "Department") {
                        $Department = 1;
                    } elseif ($value == "RCA") {
                        $RCA = 1;
                    }
                }

                $Permissionlist = new Permissionlist();
                $Permissionlist->group_name = $data["user_role"];
                $Permissionlist->create_ticket_permission = $CreateTicket;
                $Permissionlist->manage_ticket_permission = $ManageTicket;
                $Permissionlist->create_customer_permission = $CreateCustomer;
                $Permissionlist->customer_list_permission = $Customerlist;
                $Permissionlist->knowledge_base_permission = $KnowledgeBase;
                $Permissionlist->email_permission = $Email;
                $Permissionlist->report_permission = $Report;
                $Permissionlist->process_permission = $Process;
                $Permissionlist->user_permission = $User;
                $Permissionlist->access_permission = $Permission;
                $Permissionlist->status_permission = $Status;
                $Permissionlist->category_permission = $Category;
                $Permissionlist->country_state_city_permission = $Country_State;
                $Permissionlist->product_permission = $Product;
                $Permissionlist->department_permission = $Department;
                $Permissionlist->rca_permission = $RCA;
                $Permissionlist->save();

                //}
                if (Auth::user()->user_type == "Admin") {
                    return redirect("admin/userpermission")->with(
                        "success",
                        "Successfully Set User Permission!"
                    );
                } else {
                    return redirect("user/userpermission")->with(
                        "success",
                        "Successfully Set User Permission!"
                    );
                }
            }
        }

        //}
    }

    public function owner_task_assign(Request $request)
    {
        $task_id = $request->id;
        $owner_name = $request->owner_name;
        $user_id = $request->user_id;

        //print_r($task_id);

        //echo $owner_name.'|'.$user_id;
        foreach ($task_id as $key => $task_ids) {
            $Task = Task::where("id", "=", $task_ids)->update([
                "owner" => $owner_name,
                "assignby" => Auth::user()->name,
            ]);

            $result = [
                "msg" => "Task assigned to successfully",
                "response_code" => "201",
                "heading" => "Task assigned to successfully",
                "text" => "Assigned the Task",
                "icon" => "success",
            ];
        }

        return response()->json($result);
    }

    public function owner_name_assign(Request $request)
    {
        //$data=$request->all();
        //print_r($data);die();   
        $user_id = $request->user_id;
        $agent_id = $request->agent_id;
        $ticket = $request->ticket_number;
        $note = $request->note;
        date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d H:i:s', time ());
        $updatedTime = date( 'Y-m-d H:i:s', time ());
        $User = User::select("*")
            ->where("id", "=", $user_id)
            ->first();
        $assign_email = $User["email"];
        $department_name = $User["department_name"];
        $owner_name = $User["name"];
        //echo $department_name;die();

        foreach ($ticket as $key => $ticketid) {
            $Ticketfind = Ticket::select("*")
                ->where("id", "=", $ticket[$key])
                ->get();
                    
            foreach ($Ticketfind as $key => $Ticketdetail) {
                $logTicket = $Ticketdetail->ticket_number;
                $email_id = $Ticketdetail->email_id;
                $department = $Ticketdetail->department;

                //echo $Ticketdetail->ticket_number;die();  

                if ($department == $department_name) {
                    $Ticketupdate = Ticket::where(
                        "ticket_number",
                        "=",
                        $Ticketdetail->ticket_number
                    )->update([
                        "owner" => $agent_id,
                        "status" => "Open",
                        "sub_status" => "Open",
                        "note_assign" => $note

                    ]);

                    $Task = Task::where(
                        "ticket_number",
                        "=",
                        $Ticketdetail->ticket_number
                    )->update(["owner" => $agent_id]);
                    
                    $Email = Email::where("ticket_number","=",$Ticketdetail->ticket_number
                    )->update(["owner" => $agent_id]);

                    $Customer = Customer::where(
                        "customer_id",
                        "=",
                        $Ticketdetail->customer_id
                    )->update(["owner" => $agent_id]);

                    $Ticketfetch = Ticket::select("*")
                        ->where("ticket_number", "=", $logTicket)
                        ->first();

                    $system_remark =
                        "This ticket assigned to " .
                        $agent_id .
                        " assign by " .
                        Auth::user()->name;
                    $case_status = "Ticket assigned";
                    $feadback = Auth::user()->name . " Assigned the ticket";
                    $user_name = Auth::user()->name;
                    $user_id = Auth::user()->id;
                    $status = $Ticketfetch["status"];
                    $sub_status = $Ticketfetch["sub_status"];
                    $owner = $Ticketfetch["owner"];

                    $Logfiles = new Logfiles();
                    $Logfiles->ticket_number = $logTicket;
                    $Logfiles->process_name = "HISTORY";
                    $Logfiles->system_remark = $system_remark;
                    $Logfiles->case_status = $case_status;
                    $Logfiles->feadback = $feadback;
                    $Logfiles->user_id = $user_id;
                    $Logfiles->user_name = $user_name;
                    $Logfiles->status = $Ticketfetch["status"];
                    $Logfiles->sub_status = $Ticketfetch["sub_status"];
                    $Logfiles->owner = $Ticketfetch["owner"];
                    $Logfiles->assign_note = $note;
                    $Logfiles->created_at=$updatedTime;
                    $Logfiles->save();

                    $data = [
                        "agent_id" => $agent_id,
                        "logTicket" => $logTicket,
                        "system_remark" => $system_remark,
                        "case_status" => $case_status,
                        "status" => $status,
                    ];

                    Mail::to($assign_email, $email_id)->send(new Assign($data));

                    $result = [
                        "msg" => "Ticket assigned to successfully",
                        "response_code" => "201",
                        "heading" => "Ticket assigned to successfully",
                        "text" => "Assigned the ticket",
                        "icon" => "success",
                    ];
                 } elseif ($department != "") {

                   $Ticketupdate = Ticket::where(
                        "ticket_number",
                        "=",
                        $Ticketdetail->ticket_number
                    )->update([
                        "owner" => $agent_id,
                        "department" => $department_name,
                        "status" => "Open",
                        "sub_status" => "Open",
                    ]);

                    $Task = Task::where(
                        "ticket_number",
                        "=",
                        $Ticketdetail->ticket_number
                    )->update(["owner" => $agent_id]);
                    $Email = Email::where("ticket_number","=",$Ticketdetail->ticket_number
                    )->update(["owner" => $agent_id]);
                    $Customer = Customer::where(
                        "customer_id",
                        "=",
                        $Ticketdetail->customer_id
                    )->update(["owner" => $agent_id]);

                    $Ticketfetch = Ticket::select("*")
                        ->where("ticket_number", "=", $logTicket)
                        ->first();

                    $system_remark =
                        "This ticket assigned to " .
                        $agent_id .
                        " assign by " .
                        Auth::user()->name;
                    $case_status = "Ticket assigned";
                    $feadback = Auth::user()->name . " Assigned the ticket";
                    $user_name = Auth::user()->name;
                    $user_id = Auth::user()->id;
                    $status = $Ticketfetch["status"];
                    $sub_status = $Ticketfetch["sub_status"];
                    $owner = $owner_name;

                    $Logfiles = new Logfiles();
                    $Logfiles->ticket_number = $logTicket;
                    $Logfiles->process_name = "HISTORY";
                    $Logfiles->system_remark = $system_remark;
                    $Logfiles->case_status = $case_status;
                    $Logfiles->feadback = $feadback;
                    $Logfiles->user_id = $user_id;
                    $Logfiles->user_name = $user_name;
                    $Logfiles->status = $Ticketfetch["status"];
                    $Logfiles->sub_status = $Ticketfetch["sub_status"];
                    $Logfiles->owner = $owner_name;
                    $Logfiles->save();

                    $data = [
                        "agent_id" => $agent_id,
                        "logTicket" => $logTicket,
                        "system_remark" => $system_remark,
                        "case_status" => $case_status,
                        "status" => $status,
                    ];

                    Mail::to($assign_email, $email_id)->send(new Assign($data));

                    $result = [
                        "msg" => "Ticket assigned to successfully",
                        "response_code" => "201",
                        "heading" => "Ticket assigned to successfully",
                        "text" => "Assigned the ticket",
                        "icon" => "success",
                    ];
                } else {
                    $result = [
                        "msg" => "Ticket assigned Department not match",
                        "response_code" => "201",
                        "heading" => "Ticket assigned Department not match",
                        "text" => "Department not match",
                        "icon" => "success",
                    ];
                }
            }
        }

        return response()->json($result);
    }

    public function ManagesTicketdetails(Request $request)
    {
        $id = $request->id;
        $read = $request->read;
        

        $Ticket = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();
        $logticket=$Ticket['ticket_number'];
        $logid = Logfiles::select("*")
            ->where("ticket_number", "=", $logticket)
            ->first();
       // echo $logid=$logid['id'].'|'.$logid['noti_read'];die();
        //echo $logid.'|'.$read;die();
        $Ticketdetail = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();
        $ticket_no=$Ticketdetail['ticket_number'];
        if($read!='' && $id!=''){
        $ticketread = Logfiles::where("id", "=", $logid)->update(["noti_read" => 1]);
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
        }
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
        return view("/admin/Solutions"); //->with('showallcate',$showallcate);
    }

    public function catedelete(Request $request)
    {
        $id = $request->id;

        $duplicatecheck = subcategory::select("*")
            ->where("cateid", "=", $id)
            ->get();

        if (count($duplicatecheck) > 0) {
            return redirect("/admin/category")->with(
                "flash_message_error",
                "already sub category exists Then delete sub category Deleted!"
            );
        } else {
            $Categorysub = Categorysub::where("category_name", "=", $id);
            $Categorysub->delete();
            return redirect("/admin/category")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }
    public function catesubdelete(Request $request)
    {
        $id = $request->id;
        $Categorysub = subcategory::find($id);
        $Categorysub->delete();
        return redirect("/admin/category")->with(
            "flash_message_error",
            "Successfully Delete"
        );
    }

    public function changepassword()
    {
        return view("/admin/changepassword");
    }

    public function resetpass(Request $request)
    {
        $data = $request->all();
        $id = Auth::user()->id;
        //echo '<pre>';
        //print_r($data);die();

        $validator = Validator::make($data, [
            "password" => ["required", "string", "min:6", "confirmed"],
        ]);

        $validator->validate();

        $result = User::where("id", $id)->update([
            "password" => Hash::make($data["password"]),
        ]);

        if ($result) {
            return redirect("/admin/changepassword")->with(
                "success",
                "Successfully Change Password. Please login Again!"
            );
            //return view('streamshow');
        } else {
            return redirect("/admin/changepassword")->with(
                "error",
                "There has been an error!"
            );
        }
    }

    public function update_password(Request $request)
    {
        $data = $request->all();
        $id = Auth::user()->id;
        //echo '<pre>';
        //print_r($data);

        $hashedPassword = Auth::user()->password;
        if (\Hash::check($data["password"], $hashedPassword)) {
            Sess::where("session_id", Auth::user()->id)
                ->where("last_activity", 1)
                ->delete();
            if (Auth::user()->user_type == "Admin") {
                return redirect("/admin/setnewpassword")->with(
                    "flash_message_success",
                    "This is Old Password Please Enter New Password!"
                );
            } else {
                return redirect("/user/setnewpassword")->with(
                    "flash_message_success",
                    "This is Old Password Please Enter New Password!"
                );
            }
        } else {
            $validator = Validator::make($data, [
                "password" => ["required", "string", "min:6", "confirmed"],
            ]);

            $validator->validate();
            $result = User::where("id", $id)->update([
                "password" => Hash::make($data["password"]),
                "password_status" => "1",
            ]);

            if ($result) {
                Sess::where("session_id", Auth::user()->id)
                    ->where("last_activity", 1)
                    ->delete();
                if (Auth::user()->user_type == "Admin") {
                    Auth::logout();
                    Session::flush();
                    return redirect("/admin")->with(
                        "success",
                        "Successfully Change Password. Please login Again!"
                    );
                } else {
                    Auth::logout();
                    Session::flush();
                    return redirect("/user")->with(
                        "success",
                        "Successfully Change Password. Please login Again!"
                    );
                }
            } else {
                Sess::where("session_id", Auth::user()->id)
                    ->where("last_activity", 1)
                    ->delete();

                Auth::logout();
                Session::flush();
                return redirect("/user/setnewpassword")->with(
                    "error",
                    "There has been an error!"
                );
            }
        }
    }

    public function newpassword()
    {
        return view("admin.setnewpassword");
    }

    public function category()
    {
        $showallcate = Categorysub::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/newcategory")->with("showallcate", $showallcate);
    }

    public function edit_category(Request $request)
    {
        $id = $request->id;
        $Categorysub = Categorysub::find($id);
        $id = $Categorysub->id;
        $category_name = $Categorysub->category_name;
        $arr = [
            "id" => $id,
            "category_name" => $category_name,
        ];

        return response()->json($arr);
    }

    public function category_edit(Request $request)
    {
        $id = $request->edit_categoryid;
        $category_name = $request->category_name;
        $old_edit_category = $request->old_edit_category;
        $subcategorycheck = subcategory::where(
            "cateid",
            $old_edit_category
        )->get();
        if (count($subcategorycheck) > 0) {
            foreach ($subcategorycheck as $key => $value) {
                $updatesubcategory = subcategory::where(
                    "id",
                    "=",
                    $value->id
                )->update(["cateid" => $category_name]);
            }
        }
        $updatecategory = Categorysub::where("id", "=", $id)->update([
            "category_name" => $category_name,
        ]);

        if ($updatecategory) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }
    public function store_designation(Request $request)
    {
        $Designation = new Designation();
        $Designation->designation = $request->designation_name;
        $Designation->save();

        if ($Designation) {
            $arr = ["msg" => "Successfully add designation", "status" => true];
        } else {
            $arr = [
                "msg" => "server error. Please try again later",
                "status" => false,
            ];
        }
        return response()->json($arr);
    }

    public function subcategory()
    {
        $subcategory = Categorysub::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/subcategory")->with("subcategory", $subcategory);
    }

    public function edit_subcategory(Request $request)
    {
        $id = $request->id;
        $subcategory = subcategory::where("id", $id)->get();

        foreach ($subcategory as $key => $subcategorys) {
            $id = $subcategorys->id;
            $category_name = $subcategorys->cateid;
            $sub_category = $subcategorys->sub_category;
            $arr = [
                "id" => $id,
                "category_name" => $category_name,
                "sub_category" => $sub_category,
            ];
        }

        return response()->json($arr);
    }

    public function subcategory_edit(Request $request)
    {
        $id = $request->edit_subcategoryid;
        $category_name = $request->category_name;
        $subcate = $request->subcate;

        $updatesubcategory = subcategory::where("id", "=", $id)->update([
            "sub_category" => $subcate,
        ]);

        if ($updatesubcategory) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function storenewcategory(Request $request)
    {
        $input = $request->all();

        $request->validate([
            "category_name" => "required",
        ]);
        $duplicatecheck = Categorysub::select("*")
            ->where("category_name", "=", $input["category_name"])
            ->get();
        if (count($duplicatecheck) > 0) {
            $arr = ["msg" => "Already Categoy Exit!", "status" => true];
        } else {
            $check = Categorysub::create($input);

            if ($check) {
                $arr = ["msg" => "Successfully Add Category", "status" => true];
            } else {
                $arr = [
                    "msg" => "Server error. Please try again later",
                    "status" => false,
                ];
            }
        }
        return response()->json($arr);
    }

    public function storesubcategory(Request $request)
    {
        $input = $request->all();

        $request->validate([
            "category_name" => "required",
            "sub_category" => "required",
        ]);

        $duplicatecheck = subcategory::select("*")
            ->where("sub_category", "=", $input["sub_category"])
            ->get();

        if (count($duplicatecheck) > 0) {
            $arr = ["msg" => "Already Categoy Exit!", "status" => true];
        } else {
            $check = new subcategory();
            $check->cateid = $input["category_name"];
            $check->sub_category = $input["sub_category"];
            $check->save();

            if ($check) {
                $arr = [
                    "msg" => "Successfully Add Sub Category",
                    "status" => true,
                ];
            } else {
                $arr = [
                    "msg" => "Server error. Please try again later",
                    "status" => false,
                ];
            }
        }
        return response()->json($arr);
    }

    public function fetchsubcategory(Request $request)
    {
        $Category = $request->Category;
        $data = subcategory::where("cateid", $Category)->get();
        return response()->json($data);
    }

    public function create_status()
    {

        $status = New_status::select('*')->get();
        return view("/admin/create_status")->with("status", $status);
    }

    public function substatus_new_add(Request $request)
    {
        $input = $request->all();
       
        $request->validate([
            "sub_status" => "required",
            "status" => "required",
        ]);
        $data=array('status'=>$input['status'], 'process_name'=>$input['process_name'], 'sub_status'=>$input['sub_status']);

        $check = Status::create($data);
        $arr = [
            "msg" => "Something goes to wrong. Please try again later",
            "status" => false,
        ];
        if ($check) {
            $arr = ["msg" => "Successfully Form Submit", "status" => true];
        }
        return response()->json($arr);
    }

    public function status_sub_delete(Request $request)
    {
        $id = $request->id;
        $Status = Status::find($id);
        $Status->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/create_status")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        } else {
            return redirect("/user/create_status")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }

    public function cateproduct()
    {
        $Product = Product::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/product")->with("Product", $Product);
    }
    public function store_product(Request $request)
    {
        $input = $request->all();
        //print_r($input);die();

        $request->validate([
            "product" => "required",
            "product_category" => "required",
            //'owner' => 'required'
        ]);
        //$check = Product::create($input);

        $check = new Product();
        $check->product = $input["product"];
        $check->product_code = $input["product_code"];
        $check->product_brand = $input["product_brand"];
        $check->product_category = $input["product_category"];
        $check->owner = Auth::user()->name;

        $check->created_at = date("Y-m-d H:i:s");
        $check->updated_at = date("Y-m-d H:i:s");
        $check->save();

        if ($check) {
            $arr = ["msg" => "Successfully add Product", "status" => true];
        } else {
            $arr = [
                "msg" => "server error. Please try again later",
                "status" => false,
            ];
        }
        return response()->json($arr);
    }

    public function product_edit(Request $request)
    {
        $id = $request->id;
        $Product = Product::find($id);
        $product = $Product->product;
        $product_code = $Product->product_code;
        $product_category = $Product->product_category;
        $product_brand = $Product->product_brand;
        $owner = $Product->owner;
        $arr = [
            "id" => $id,
            "product" => $product,
            "product_code" => $product_code,
            "product_category" => $product_category,
            "product_brand" => $product_brand,
            "owner" => $owner,
        ];
        return response()->json($arr);
    }

    public function edit_productdetail(Request $request)
    {
        //$data=$request->all();
        //print_r($data);die();
        $id = $request->edit_id;
        $product = $request->product;
        $product_code = $request->product_code;
        $product_brand = $request->product_brand;
        $updateproduct = Product::where("id", "=", $id)->update([
            "product" => $product,
            "product_code" => $product_code,
            "product_brand" => $product_brand,
        ]);

        if ($updateproduct) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function product_delete(Request $request)
    {
        $id = $request->id;
        $Product = Product::find($id);
        $Product->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/product")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        } else {
            return redirect("/user/product")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }

    public function department()
    {
        $Department = Department::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/department")->with("Department", $Department);
    }
    public function store_department(Request $request)
    {
        $input = $request->all();
        $request->validate([
            "department_name" => "required",
            "process_name" => "required",
        ]);
        $check = Department::create($input);
        $arr = [
            "msg" => "Something goes to wrong. Please try again later",
            "status" => false,
        ];
        if ($check) {
            $arr = ["msg" => "Successfully Form Submit", "status" => true];
        }
        return response()->json($arr);
    }
    public function dept_edit(Request $request)
    {
        $id = $request->id;
        $Dept = Department::select("*")
            ->where("id", "=", $id)
            ->first();
        return view("/admin/dept_edit")->with("Dept", $Dept);
    }

    public function EditTicket(Request $request)
    {
        $id = $request->id;
        $edittic = Ticket::select("*")
            ->where("ticket_number", "=", $id)
            ->first();
        return view("/admin/EditTicket")->with("edittic", $edittic);
    }
    public function updateticketstore(Request $request)
    {
        /*$data=$request->all();
        echo '<pre>';
        print_r($data);
        die();*/
        //echo  $request->subject;die;
        $ticketno = $request->hdn;

        date_default_timezone_set("Asia/Kolkata");
        //$currentTime = date( 'Y-m-d h:i:s', time ());
        $updatedTime = date("Y-m-d h:i:s", time());
        $dt = date("m/d/Y");
        Ticket::where("ticket_number", $ticketno)->update([
            "subject" => $request->subject,
            "type" => $request->type,
            "category" => $request->category,
            "sub_category" => $request->sub_category,
            "status" => $request->status,
            "sub_status" => $request->sub_status,
            "source" => $request->source,
            "source_value" => $request->source_value,
            "product" => $request->product,
            "tat" => $request->tat,
            "voc" => $request->voc,
            "department" => $request->department,
            "owner" => $request->owner,
            "closure_date" => $dt,
            "remarks" => $request->remarks,
            "updated_at" => $updatedTime,
        ]);
        

          $feadback='Ticket has been Change . the ticket Number is '.$ticketno.'.';
          $system_remark='ticket has been Change by '.Auth::user()->name;
          $case_status='Ticket Change';

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles;
        $Logfiles->ticket_number = $ticketno;
        $Logfiles->process_name = 'HISTORY';
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $request->status;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->owner = $request->owner;
        $Logfiles->sub_status = $request->sub_status;
        $Logfiles->save();



        return redirect("/admin/EditTicket/" . $ticketno)->with(
            "flash_message_error",
            "Successfully Update"
        );
    }
    public function deptupdate($id)
    {
        $Department = Department::find($id);
        $Department->department_name = request("dptname");
        $Department->save();

        return json_encode(["statusCode" => 200]);
    }

    public function department_del(Request $request)
    {
        $id = $request->id;
        $Department = Department::find($id);
        $Department->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/department")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        } else {
            return redirect("/user/department")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }
    public function chkPassword(Request $request)
    {
        $data = $request->all();
        $current_password = $data["current_pwd"];
        $check_password = User::where(["admin" => "1"])->first();
        if (Hash::check($current_password, $check_password->password)) {
            echo "true";
            die();
        } else {
            echo "false";
            die();
        }
    }

    public function updatePassword(Request $request)
    {
        if ($request->isMethod("post")) {
            $data = $request->all();
            //echo "<pre>"; print_r($data); die;
            $check_password = User::where([
                "email" => Auth::user()->email,
            ])->first();
            $current_password = $data["current_pwd"];
            if (Hash::check($current_password, $check_password->password)) {
                $password = bcrypt($data["new_pwd"]);
                User::where("id", "1")->update(["password" => $password]);
                return redirect("/admin/settings")->with(
                    "flash_message_success",
                    "Password updated Successfully!"
                );
            } else {
                return redirect("/admin/settings")->with(
                    "flash_message_error",
                    "Incorrect Current Password!"
                );
            }
        }
    }

    public function register()
    {
        return view("register");
        die();
    }

    public function AddUser(Request $request)
    {
        $user = new User();
        $user->email = $request->email;
        $user->name = $request->name;
        $user->password = Hash::make($request->password);
        $user->status = 1;
        $user->created_at = date("Y-m-d H:i:s");
        $user->updated_at = date("Y-m-d H:i:s");
        $user->save();

        return view("register");
    }

    public function employeelist(Request $request)
    {
        return view("/admin/employeelist");
    }
    public function getemployeelist()
    {
        $usersQuery = User::query();
        if (Auth::user()->user_type == "Admin") {
            $users = $usersQuery
                ->select(
                    "id",
                    "username",
                    "name",
                    "email",
                    "designation",
                    "user_type",
                    "images",
                    "department_name",
                    "user_id",
                    "created_by"
                )
                ->where("user_type", "!=", "Admin")
                ->where("user_type", "!=", "customer")
                ->orderBy("id", "DESC");
        } else {
            if (Auth::user()->type == "Special") {
                $users = $usersQuery
                    ->select(
                        "id",
                        "username",
                        "name",
                        "email",
                        "designation",
                        "user_type",
                        "images",
                        "department_name",
                        "user_id",
                        "created_by"
                    )
                    ->where("name", "=", Auth::user()->name)
                    ->orderBy("id", "DESC");
            } else {
                $users = $usersQuery
                    ->select(
                        "id",
                        "username",
                        "name",
                        "email",
                        "designation",
                        "user_type",
                        "images",
                        "department_name",
                        "user_id",
                        "created_by"
                    )
                    ->where("user_type", "=", Auth::user()->user_type)
                    ->where("type", "!=", "Special")
                    ->orderBy("id", "DESC");
            }
        }

        return datatables()
            ->of($users)
            ->addColumn("checkbox", function ($data) {
                return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                    $data->user_id .
                    '" name="chk[]" />';
            })

            ->addColumn("action", function ($users) {
                if (Auth::user()->user_type == "Admin") {
                    $viewUrl = url("/admin/userscontrol/" . $users->user_id);
                    $delUrl = url("/admin/usersdel/" . $users->id);
                } else {
                    $viewUrl = url("/user/userscontrol/" . $users->user_id);
                    $delUrl = url("/user/usersdel/" . $users->id);
                }

                $btn =
                    '<a href="' .
                    $viewUrl .
                    '" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="fa fa-eye" aria-hidden="true" title="View"></i></a>&nbsp;&nbsp;';
                /*if(Auth::user()->user_type=='Admin'){*/
                $btn .=
                    '<a href="#" data-id="' .
                    $users->id .
                    '"" data-url="' .
                    $delUrl .
                    '"  class="btn btn-xs btn-primary btn-sm passingID"><i class="far fa-trash-alt"></i></a>';
                /*}*/
                return $btn;
            })
            ->rawColumns(["checkbox", "action"])
            ->make(true);
    }

    public function userdel(Request $request)
    {
        $id = $request->id;
        User::where("id", $id)->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/employeelist")->with(
                "flash_message_success",
                "Successfull Delete"
            );
        } else {
            return redirect("/user/employeelist")->with(
                "flash_message_success",
                "Successfull Delete"
            );
        }
    }

    public function Manageemployeedetails(Request $request)
    {
        $id = $request->id;
        $userdetail = User::select("*")
            ->where("user_id", "=", $id)
            ->first();
        return view("/admin/userscontrol")->with("userdetail", $userdetail);
    }
    public function user_update(Request $request)
    {
        $data = $request->all();
        //print_r($data);die();

        /*$CreateTicket=0;
         $ManageTicket=0;
         $CreateCustomer=0;
         $Customerlist=0;
         $KnowledgeBase=0;
         $Email_permission=0;
         $Report=0;
         $Process=0;
         $User=0;
         $Permission=0;
         $Status=0;
         $Category=0;
         $Country_State=0;
         $Product=0;
         $Department=0;
         $RCA=0;*/

        if ($request->create_ticket == 1) {
            $CreateTicket = 1;
        } else {
            $CreateTicket = 0;
        }
        if ($request->manage_ticket == 1) {
            $ManageTicket = 1;
        } else {
            $ManageTicket = 0;
        }
        if ($request->create_customer == 1) {
            $CreateCustomer = 1;
        } else {
            $CreateCustomer = 0;
        }
        if ($request->customer_list == 1) {
            $Customerlist = 1;
        } else {
            $Customerlist = 0;
        }
        if ($request->knowledge_base == 1) {
            $KnowledgeBase = 1;
        } else {
            $KnowledgeBase = 0;
        }
        if ($request->email_permission == 1) {
            $Email_permission = 1;
        } else {
            $Email_permission = 0;
        }
        if ($request->report == 1) {
            $Report = 1;
        } else {
            $Report = 0;
        }
        if ($request->process == 1) {
            $Process = 1;
        } else {
            $Process = 0;
        }
        if ($request->user == 1) {
            $User = 1;
        } else {
            $User = 0;
        }
        if ($request->permission == 1) {
            $Permission = 1;
        } else {
            $Permission = 0;
        }
        if ($request->status == 1) {
            $Status = 1;
        } else {
            $Status = 0;
        }
        if ($request->category == 1) {
            $Category = 1;
        } else {
            $Category = 0;
        }
        if ($request->country_state_city == 1) {
            $Country_State = 1;
        } else {
            $Country_State = 0;
        }
        if ($request->product == 1) {
            $Product = 1;
        } else {
            $Product = 0;
        }
        if ($request->department == 1) {
            $Department = 1;
        } else {
            $Department = 0;
        }
        if ($request->rca == 1) {
            $RCA = 1;
        } else {
            $RCA = 0;
        }
        $customer_care_no = $request->customer_care_no;
        $extension_no = $request->extension_no;
        $username = $request->username;
        $id = $request->user_id;
        // $name=$request->name;
        $email = $request->email;
        $phone = $request->phone_number;
        $user_type = $request->user_type;
        $department = $request->department_name;
        $designation = $request->degination;
        if (empty($request->password_status)) {
            $password_status = 1;
        } else {
            $password_status = $request->password_status;
        }
        //echo $password_status;
        //die();
        $userstatus = User::where("user_id", "=", $id)->update([
            "username" => $username,
            "email" => $email,
            "phone_number" => $phone,
            "user_type" => $user_type,
            "department_name" => $department,
            "designation" => $designation,
            "create_ticket_permission" => $CreateTicket,
            "manage_ticket_permission" => $ManageTicket,
            "create_customer_permission" => $CreateCustomer,
            "customer_list_permission" => $Customerlist,
            "knowledge_base_permission" => $KnowledgeBase,
            "email_permission" => $Email_permission,
            "report_permission" => $Report,
            "process_permission" => $Process,
            "user_permission" => $User,
            "access_permission" => $Permission,
            "status_permission" => $Status,
            "category_permission" => $Category,
            "country_state_city_permission" => $Country_State,
            "product_permission" => $Product,
            "department_permission" => $Department,
            "rca_permission" => $RCA,
            "cust_care_no" => $customer_care_no,
            "exten_no" => $extension_no,
            "password_status" => $password_status,
        ]);

        /*return $userstatus;
         die();*/

        if ($userstatus) {
            $arr = [
                "msg" => "Successfully updated",
                "response_code" => "201",
            ];
        } else {
            $arr = [
                "msg" => "Successfully not updated",
                "response_code" => "301",
            ];
        }
        return response()->json($arr);
    }

    public function createemployee(Request $request)
    {
        $data = $request->all();
        // print_r($data);die();
        $username = $request->username;
        $user_name = $request->user_name;
        $user_email = $request->user_email;
        $user_pass = $request->user_pass;
        $user_type = $request->user_type;
        $department_name = $request->department_name;
        $Process_name = $request->Process_name;
        $degination = $request->degination;
        $customer_care_no = $request->customer_care_no;
        $extension_no = $request->extension_no;
        $type_user = $request->type_user;

        $token = $request->_token;
        $user_id = mt_rand(00000, 99999);
        $CreateTicket = 0;
        $ManageTicket = 0;
        $CreateCustomer = 0;
        $Customerlist = 0;
        $KnowledgeBase = 0;
        $Email = 0;
        $Report = 0;
        $Process = 0;
        $User = 0;
        $Permission = 0;
        $Status = 0;
        $Category = 0;
        $Country_State = 0;
        $Product = 0;
        $Department = 0;
        $RCA = 0;

        //$group = Permissionlist::select('*')->where('group_name','=',$user_type)->get();

        $usercheck = User::select("*")
            ->where("email", "=", $user_email)
            ->get();

        if (count($usercheck) == 0) {
            foreach ($data["Permission"] as $key => $Permissions) {
                if ($Permissions == "Create Ticket") {
                    $CreateTicket = 1;
                } elseif ($Permissions == "Manage Ticket") {
                    $ManageTicket = 1;
                } elseif ($Permissions == "Create Customer") {
                    $CreateCustomer = 1;
                } elseif ($Permissions == "Customer list") {
                    $Customerlist = 1;
                } elseif ($Permissions == "Knowledge Base") {
                    $KnowledgeBase = 1;
                } elseif ($Permissions == "Email") {
                    $Email = 1;
                } elseif ($Permissions == "Report") {
                    $Report = 1;
                } elseif ($Permissions == "Process") {
                    $Process = 1;
                } elseif ($Permissions == "User") {
                    $User = 1;
                } elseif ($Permissions == "Permission") {
                    $Permission = 1;
                } elseif ($Permissions == "Status") {
                    $Status = 1;
                } elseif ($Permissions == "Category") {
                    $Category = 1;
                } elseif ($Permissions == "Country & State, City") {
                    $Country_State = 1;
                } elseif ($Permissions == "Product") {
                    $Product = 1;
                } elseif ($Permissions == "Department") {
                    $Department = 1;
                } elseif ($Permissions == "RCA") {
                    $RCA = 1;
                }
            }

            $user = new User();
            $user->user_id = $user_id;
            $user->username = $username;
            $user->name = $user_name;
            $user->email = $user_email;
            $user->password = Hash::make($user_pass);
            $user->designation = $degination;
            $user->user_type = $user_type;
            $user->department_name = $department_name;
            $user->remember_token = $token;
            $user->chat_status = "Offline";
            $user->status_live = "success";
            $user->Process_name = "Ticket";
            $user->create_ticket_permission = $CreateTicket;
            $user->manage_ticket_permission = $ManageTicket;
            $user->create_customer_permission = $CreateCustomer;
            $user->customer_list_permission = $Customerlist;
            $user->knowledge_base_permission = $KnowledgeBase;
            $user->email_permission = $Email;
            $user->report_permission = $Report;
            $user->process_permission = $Process;
            $user->user_permission = $User;
            $user->access_permission = $Permission;
            $user->status_permission = $Status;
            $user->category_permission = $Category;
            $user->country_state_city_permission = $Country_State;
            $user->product_permission = $Product;
            $user->department_permission = $Department;
            $user->rca_permission = $RCA;
            $user->cust_care_no = $customer_care_no;
            $user->exten_no = $extension_no;
            $user->type = $type_user;
            $user->created_by = Auth::user()->name;
            $user->status = "1";
            $user->save();

            $arr = [
                "msg" => "  add successfully",
                "response_code" => "3001",
            ];
        } else {
            $arr = [
                "msg" => "Already add",
                "response_code" => "2001",
            ];
        }
        return response()->json($arr);
        //}
    }

    public function process_list()
    {
        $processlist = Processlist::select("*")->orderBy("id", "DESC")->get();

        return view("/admin/process_list")->with("processlist", $processlist);
    }
    public function process_list_gui(Request $request)
    {
        $process_id = $request->process_id;
        $process_name = $request->process_name;
        $data = Processlist::select("*")
            ->where("process_id", "=", $process_id)
            ->where("process_name", "=", $process_name)
            ->get();

        $editlist = Tablefleldlist::select("*")
            ->where("process_id", "=", $process_id)
            ->where("process_name", "=", $process_name)
            ->first();

        return view("/admin/process_list_gui")->with([
            "data" => $data,
            "process_id" => $process_id,
            "process_name" => $process_name,
        ]);
    }

    public function created_process(Request $request)
    {
        //echo $request->process_id;die();
        $processlist = Processlist::select("*")
            ->orderBy("id", "DESC")
            ->get();
        $dt = date("Y-m-d");
        $Processlist = new Processlist();
        $Processlist->process_id = $request->process_id;
        $Processlist->process_name = $request->process_name;
        $Processlist->created_date = $dt;
        $Processlist->status = $request->status;
        $Processlist->save();
        if ($Processlist) {
            $arr = [
                "msg" => "Successfull",
                "response_code" => "201",
            ];
        } else {
            $arr = [
                "msg" => "UnSuccessfull",
                "response_code" => "301",
            ];
        }
        return redirect("/admin/process_list")->with([
            "arr" => $arr,
            "processlist" => $processlist,
        ]);
    }
    public function process_list_del(Request $request)
    {
        $id = $request->id;
        Processlist::find($id)->delete();
        $processlist = Processlist::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return redirect("/admin/process_list")->with([
            "processlist" => $processlist,
        ]);
    }

    public function dynamicfield(Request $request)
    {
        $input_label = $request->input_label;
        $field_type = $request->field_type;
        $field_colm = $request->field_colm;
        $field_colm1 = str_replace(" ", "_", $field_colm);
        $level_name = $request->level_name;
        $extra_values = $request->extra_values;
        $process_id = $request->process_id;
        $process_name = $request->process_name;

        $Processlist = new Tablefleldlist();
        $Processlist->process_id = $process_id;
        $Processlist->process_name = $process_name;
        $Processlist->field_colm = $field_colm1;
        $Processlist->field_type = $field_type;
        $Processlist->extra_values = $extra_values;
        $Processlist->input_label = $input_label;
        $Processlist->input_name = $field_colm1;
        $Processlist->level = $level_name;
        $Processlist->save();
        if ($Processlist) {
            if ($field_colm != "header") {
                $table_name = "process_" . $process_name;

                //Schema::table($table_name, function(Blueprint $table) use ($field_colm1, &$fluent)
                //{
                //$fluent = $table->string($field_colm1)->nullable();
                //});
                $arr = ["msg" => "Successfull"];
            }
        } else {
            $arr = ["msg" => "UnSuccessfull"];
        }
        return response()->json($arr);
    }

    public function process_list_gui_edit(Request $request)
    {
        $process_id = $request->process_id;
        $process_name = $request->process_name;

        $editlist = Tablefleldlist::select("*")
            ->where("process_id", "=", $process_id)
            ->get();

        return view("/admin/process_list_gui")->with([
            "editlist" => $editlist,
            "process_id" => $process_id,
            "process_name" => $process_name,
        ]);
    }
    public function dynamicfield_fetch(Request $request)
    {
        $id = $request->id;
        $process_id = $request->process_id;
        $process_name = $request->process_name;
        $editlist = Tablefleldlist::select("*")
            ->where("id", "=", $id)
            ->first();

        return view("/admin/process_list_gui")->with([
            "editlist" => $editlist,
            "process_id" => $process_id,
            "process_name" => $process_name,
        ]);
    }

    public function created_dynamic_field_edit(Request $request)
    {
        $id = $request->hdn;
        $input_label = $request->input_label;
        $field_type = $request->field_type;
        $field_colm = $request->field_colm;
        $field_colm1 = str_replace(" ", "_", $field_colm);
        $level_name = $request->level_name;
        $extra_values = $request->extra_values;
        $process_id = $request->process_id;
        $process_name = $request->process_name;

        $updatelist = Tablefleldlist::where("id", "=", $id)->update([
            "field_type" => $field_type,
            "extra_values" => $extra_values,
            "level" => $level_name,
        ]);

        if ($updatelist) {
            //$editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)
            //->where('process_name','=',$process_name)->first();
            $arr = ["msg" => "Successfull Update"];
        } else {
            //$editlist = Tablefleldlist::select('*')->where('process_id','=',$process_id)
            //->where('process_name','=',$process_name)->first();
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function process_list_gui_feild_del(Request $request)
    {
        $id = $request->id;
        $field_colm = $request->field_colm;
        $process_id = $request->process_id;
        $process_name = $request->process_name;
        Tablefleldlist::find($id)->delete();
        $table_name = "process_" . $process_name;
        //echo $field_colm;die;
        if (Schema::hasColumn($table_name, $field_colm)) {
            Schema::table($table_name, function (Blueprint $table) use (
                $field_colm,
                &$fluent
            ) {
                $table->dropColumn($field_colm);
            });
        }

        $editlist = Tablefleldlist::select("*")
            ->where("process_id", "=", $process_id)
            ->get();

        return redirect(
            "/admin/process_list_gui/" . $process_id . "/" . $process_name
        )->with([
            "editlist" => $editlist,
            "process_id" => $process_id,
            "process_name" => $process_name,
        ]);
    }
    public function rcashow()
    {
        $rcalist = Process_rca::select("*")
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/rca")->with("rcalist", $rcalist);
    }

    public function addrca(Request $request)
    {
        $rcaname = $request->rcaname;
        $category_name = $request->category_name;

        $Process_rca = new Process_rca();
        $Process_rca->process_name = "Ticket";
        $Process_rca->rca_name = $rcaname;
        $Process_rca->category_name = $category_name;
        $Process_rca->save();

        if ($Process_rca) {
            $arr = ["msg" => "Successfully Add", "status" => true];
        } else {
            $arr = ["msg" => "Please try again later", "status" => false];
        }

        return response()->json($arr);
    }

    public function delrca($id)
    {
        Process_rca::find($id)->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/rca");
        } else {
            return redirect("/user/rca");
        }
    }

    public function calendar(Request $request)
    {
        $Calendartbl = Calendartbl::select("*")->get();
        return view("/admin/calendar")->with("Calendartbl", $Calendartbl);
    }

    public function add_leave_listcal(Request $request)
    {
        $title = $request->title;
        $To_holiday = $request->To_holiday;
        $From_holiday = $request->From_holiday;
        $Weekday = $request->Weekday;
        $array = [];
        $Variable1 = strtotime($To_holiday);
        $Variable2 = strtotime($From_holiday);
        for (
            $currentDate = $Variable1;
            $currentDate <= $Variable2;
            $currentDate += 86400
        ) {
            $Store = date("Y-m-d", $currentDate);
            $array2 = date("D", $currentDate);
            $array[$array2][] = $Store;
        }

        foreach ($Weekday as $key1 => $value1) {
            //foreach ($array[$value1] as $key => $value)
            //{

            $start = date("Y-m-d h:i:s", strtotime($value1));
            $end = date("Y-m-d h:i:s", strtotime($value1));
            $day = date("D", strtotime($value1));

            $Calendartbl = new Calendartbl();
            $Calendartbl->title = $title;
            $Calendartbl->start = $start;
            $Calendartbl->end = $end;
            $Calendartbl->day = $day;
            $Calendartbl->save();
            //}
        }
        $arr = [
            "msg" => "Holiday Add to successfully",
            "response_code" => "201",
        ];
        return response()->json($arr);
    }

    public function fetch_event(Request $request)
    {
        //echo 'sunil';die;

        $Calendartbl = Calendartbl::select("*")
            ->orderBy("id", "DESC")
            ->get();
        $eventArray = [];
        //print_r($Calendartbl);die;
        foreach ($Calendartbl as $key => $Calendartbls) {
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
        $Calendartbl = new Calendartbl();
        $Calendartbl->title = $title;
        $Calendartbl->start = $start;
        $Calendartbl->end = $end;
        //$Calendartbl->day  = $day;
        $Calendartbl->save();

        $arr = [
            "msg" => "Holiday Add to successfully",
            "response_code" => "201",
        ];
        return response()->json($arr);
    }

    public function status_sub_edit(Request $request)
    {
        $id = $request->id;
        $Status = Status::find($id);
        $status = $Status->status;
        $sub_status = $Status->sub_status;
        $arr = [
            "id" => $id,
            "sub_status" => $sub_status,
        ];

        return response()->json($arr);
    }

    public function substatus_edit(Request $request)
    {

        $data=$request->all();
       
        $id = $request->editid;
        $status = $request->status;
        $sub_status = $request->sub_status;
        $updatestatus = Status::where("id", "=", $id)->update([
            "status" => $status,
            "sub_status" => $sub_status,
        ]);

        if ($updatestatus) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function departments_edit(Request $request)
    {
        $id = $request->id;
        $Department = Department::find($id);
        $department_name = $Department->department_name;

        $arr = [
            "id" => $id,
            "department_name" => $department_name,
        ];
        return response()->json($arr);
    }

    public function departments_update(Request $request)
    {
        $id = $request->edit_id;
        $department_name = $request->department_name;

        $updatedepartment = Department::where("id", "=", $id)->update([
            "department_name" => $department_name,
        ]);

        if ($updatedepartment) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function rca_edit(Request $request)
    {
        $id = $request->id;
        $Process_rca = Process_rca::find($id);
        $rca_name = $Process_rca->rca_name;
        $category_name = $Process_rca->category_name;
        $arr = [
            "id" => $id,
            "rca_name" => $rca_name,
            "category_name" => $category_name,
        ];
        return response()->json($arr);
    }

    public function rca_update(Request $request)
    {
        $id = $request->edit_id;
        $rcaname = $request->rcaname;
        $category_name = $request->category_name;

        $updaterca = Process_rca::where("id", "=", $id)->update([
            "rca_name" => $rcaname,
        ]);

        if ($updaterca) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function dataget_substatus(Request $request)
    {
        $action = $request->action;
        $status = $request->status;
        $process = $request->process;
        if ($action == "selcted") {
            $html = "";
            $substatus = Status::select("*")
                ->where("process_name", "=", $process)
                ->where("status", "=", $status)
                ->get();
            ///echo count($substatus);
            foreach ($substatus as $substatuss) {
                $sub_status = $substatuss->sub_status;
                $html .=
                    '<option value="' .
                    $sub_status .
                    '">' .
                    $sub_status .
                    "</option>";
            }
            echo $html;
        }
    }

    public function ticket_addremark(Request $request)
    {

        //$data=$request->all();
       // print_r($data);die();
        $action = $request->action;
         date_default_timezone_set('Asia/Kolkata');// change according timezone
        $currentTime = date( 'Y-m-d H:i:s', time ());
        $updatedTime = date( 'Y-m-d H:i:s', time ());
        $Ticket_number = $request->Ticket_number;
        $delivery_date = $request->delivery_date;
        $delivery_time = $request->delivery_time;
      
        $resolution = $request->resolution;
        if ($action == "addremark") {
            $Ticketdetail = Ticket::select("*")
                ->where("ticket_number", "=", $Ticket_number)
                ->get();
            foreach ($Ticketdetail as $key => $Tickets) {
                $status = $request->status;
                $substatus = $request->substatus;
                $feedback = $request->feedback;
                $process_name = $request->process_name;
                $customer_id = $request->customer_id;

                $customer_name = $Tickets->customer_name;
                $ticket_number = $Tickets->ticket_number;
                $email_id = $Tickets->email_id;

                //////////////////////////////////////////////////////
                $status_f = $Tickets->status;
                $sub_status_f = $Tickets->sub_status;
                $owner_f = $Tickets->owner;
                //echo $status_f .'|'. $sub_status_f .'|'. $owner_f;die;
                $update_ticket = Ticket::where("ticket_number","=",$Ticket_number)->update([
                    "status" => $status,
                    "sub_status" => $substatus,
                    "del_date_tat" => $delivery_date,
                    "del_time_tat" => $delivery_time,
                    "del_comm_tat" => $request->feedback,
                ]);

                //$updateticket  = Ticket::where('id','=',$data['ticketid'])->update([ 'del_date_tat'=>$data['delivery_date'], 'del_time_tat'=>$time, 'del_comm_tat'=>$data['deliver_comment'] ]);

                $system_remark =
                    "This ticket status changed by " .
                    Auth::user()->name .
                    ". Status changed from " .
                    $status_f .
                    " to " .
                    $status;
                $case_status = "Ticket status changed";
                $Ticket_number = $request->Ticket_number;
                $feadback = $request->feedback;
                $owner = $owner_f;

                $Logfiles = new Logfiles();
                $Logfiles->ticket_number = $Ticket_number;
                $Logfiles->process_name = "HISTORY";
                $Logfiles->system_remark = $system_remark;
                $Logfiles->case_status = $case_status;
                $Logfiles->feadback = $feadback;
                $Logfiles->user_id = Auth::user()->id;
                $Logfiles->user_name = Auth::user()->name;
                $Logfiles->status = $status;
                $Logfiles->owner = $owner;
                $Logfiles->resolution = $resolution;
                $Logfiles->sub_status = $substatus;
                $Logfiles->delivery_date = $delivery_date;
                $Logfiles->delivery_time = $delivery_time;
                $Logfiles->created_at=$updatedTime;
                $Logfiles->save();

                $datasend = [
                    "customer_name" => $customer_name,
                    "email_id" => $email_id,
                    "ticket_number" => $ticket_number,
                    "status" => $status_f,
                    "sub_status" => $sub_status_f,
                    "feadback" => $feadback,
                ];

                //Mail::to($email_id)->send(new Activity($datasend));
                $arr = [
                    "message" => "Status change successfully",
                    "response_code" => "3001",
                    "heading" => "Status change successfully",
                    "text" => "s",
                    "icon" => "success",
                ];
            }

            echo json_encode($arr);
        }
    }

    public function ticket_addnote(Request $request)
    {
        $action = $request->action;
        $process_name = $request->process_name;
        $strik_note = $request->strik_note;
        $Ticket_number = $request->Ticket_number;

        if ($action == "addnote") {
            //echo $process_name .'|'.$strik_note.'|'.$Ticket_number;die();

            $Note = new Note();
            $Note->process_name = $process_name;
            $Note->ticket_number = $Ticket_number;
            $Note->note_text = $strik_note;
            $Note->save();

            $arr = [
                "msg" => "Add Note Successfully",
                "response_code" => "3001",
                "heading" => "Add Note successfully",
            ];
        }

        echo json_encode($arr);
    }

    public function ticket_addtask(Request $request)
    {
        $addtaskdetail = $request->addtaskdetail;
        $screen_share = $request->file("screen_share");
        $created = $request->created;
        $process_name = $request->process_name;
        $Ticket_id = $request->Ticket_id;
        $Ticket_number = $request->Ticket_number;
        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        if ($screen_share != "") {
            $ext = $screen_share->getClientOriginalExtension();
        }
        //echo $user_id.'|'.$user_name;die();

        //echo $addtaskdetail .'|'. $ext .'|'. $created .'|'. $process_name .'|'. $Ticket_number;
        //die();
        if ($screen_share == "") {
            $Ticket = Ticket::where(
                "ticket_number",
                "=",
                $Ticket_number
            )->first();
            $status = $Ticket["status"];
            $sub_status = $Ticket["sub_status"];
            $owner = $Ticket["owner"];
            $ticket_number = $Ticket["ticket_number"];

            $update_ticket = Ticket::where(
                "ticket_number",
                "=",
                $ticket_number
            )->update(["task" => "T"]);

            $Task = new Task();
            $Task->ticket_id = $Ticket_id;
            $Task->ticket_number = $Ticket_number;
            $Task->process_name = $process_name;
            $Task->addtaskdetail = $addtaskdetail;
            $Task->status = $status;
            $Task->sub_status = $sub_status;
            $Task->owner = $owner;
            $Task->createdby = $created;
            $Task->save();

            $feadback =
                "New Task created. the ticket Number is " .
                $Ticket_number .
                ".";
            $system_remark =
                "Ticket has been created by Working Process at " . $user_name;
            $case_status = "Ticket Working Process";

            /* $Log = new Log;
            $Log->ticket_number = $Ticket_number;
            $Log->process_name = 'HISTORY';
            $Log->system_remark = $system_remark;
            $Log->case_status = $case_status;
            $Log->feadback = $feadback;
            $Log->task = $addtaskdetail;
            $Log->user_id = $user_id;
            $Log->user_name = $user_name;
            $Log->status = $status;
            $Log->owner = $owner;
            $Log->sub_status = $sub_status;
            $Log->save();*/

            $arr = [
                "msg" => "Add Task Successfully",
                "response_code" => "201",
                "heading" => "Add Note successfully",
            ];
        } else {
            if ($ext == "jpg" || $ext == "jpeg") {
                $Ticket = Ticket::where(
                    "ticket_number",
                    "=",
                    $Ticket_number
                )->first();
                $status = $Ticket["status"];
                $sub_status = $Ticket["sub_status"];
                $owner = $Ticket["owner"];
                $ticket_number = $Ticket["ticket_number"];

                $update_ticket = Ticket::where(
                    "ticket_number",
                    "=",
                    $ticket_number
                )->update(["task" => "T"]);

                $Task = new Task();
                $Task->ticket_number = $Ticket_number;
                $Task->process_name = $process_name;
                $Task->addtaskdetail = $addtaskdetail;
                $Task->status = $status;
                $Task->sub_status = $sub_status;
                $Task->owner = $owner;
                $Task->createdby = $created;
                $Task->save();

                $ext = $screen_share->getClientOriginalExtension();
                $imageName =
                    date("YmdHis") .
                    "." .
                    $screen_share->getClientOriginalExtension();
                $path = $screen_share->move(
                    public_path("/document"),
                    $imageName
                );
                $file_size = $path->getSize();
                $file_size = number_format($file_size / 1048576, 2) . " MB";
                $document_id = "DOC" . date("Ymdhis") . rand(000, 999);

                $Document = new Document();
                $Document->document_id = $document_id;
                $Document->document_type = $ext;
                $Document->document_name = $imageName;
                $Document->document_size = $file_size;
                $Document->ticket_number = $Ticket_number;
                $Document->process_name = $process_name;
                //$Document->customer_id = $customer_id;
                $Document->save();

                $feadback =
                    "New Task created. the ticket Number is " .
                    $Ticket_number .
                    ".";
                $system_remark =
                    "Ticket has been created by Working Process at " .
                    $user_name;
                $case_status = "Ticket Working Process";

                /*$Log = new Log;
            $Log->ticket_number = $Ticket_number;
            $Log->process_name = 'HISTORY';
            $Log->system_remark = $system_remark;
            $Log->case_status = $case_status;
            $Log->feadback = $feadback;
            $Log->task = $addtaskdetail;
            $Log->user_id = $user_id;
            $Log->user_name = $user_name;
            $Log->status = $status;
            $Log->owner = $owner;
            $Log->sub_status = $sub_status;
            $Log->save();*/

                $arr = [
                    "msg" => "Add Task Successfully",
                    "response_code" => "201",
                    "heading" => "Add Note successfully",
                ];
            } else {
                $arr = [
                    "msg" => "Only allowed jpg/jpeg",
                    "response_code" => "201",
                ];
            }
        }

        echo json_encode($arr);
    }
    public function viewallnotification(Request $request)
    {
        $user_name = Auth::user()->name;
        $processstatus = DB::table("process_log")
            ->select("*")
            ->where("user_name", "=", $user_name)
            ->orwhere("owner", "=", $user_name)
            ->orderBy("id", "DESC")
            ->get();
        return view("/admin/viewallnotification")->with(
            "processstatus",
            $processstatus
        );
    }

    public function specialuserlist()
    {
        return view("/admin/specialuserlist"); //->with('processstatus',$processstatus);
    }

    public function getspecialuserlist()
    {
        $usersQuery = User::query();

        $users = $usersQuery
            ->select(
                "id",
                "name",
                "email",
                "user_type",
                "images",
                "department_name",
                "user_id"
            )
            ->where("user_type", "TL")
            ->orderBy("id", "DESC");

        return datatables()
            ->of($users)
            ->addColumn("checkbox", function ($data) {
                return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                    $data->user_id .
                    '"    name="chk[]" />';
            })

            ->addColumn("action", function ($users) {
                $viewUrl = url("/admin/userscontrol/" . $users->user_id);
                $delUrl = url("/admin/specialusersdel/" . $users->id);
                $btn =
                    '<a href="' .
                    $viewUrl .
                    '" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="fa fa-eye" aria-hidden="true" title="View"></i></a>&nbsp;&nbsp;';
                $btn .=
                    '<a href="' .
                    $delUrl .
                    '" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i class="far fa-trash-alt"></i></a>';
                return $btn;
            })
            ->rawColumns(["checkbox", "action"])
            ->make(true);
    }

    public function createspecialemployee(Request $request)
    {
        //$data=$request->all();
        //print_r($data);;
        //die();
        $username = $request->username;
        $user_name = $request->user_name;
        $user_email = $request->user_email;
        $user_pass = $request->user_pass;
        $user_type = $request->user_type;
        $department_name = $request->department_name;
        $Process_name = $request->Process_name;
        $token = $request->_token;
        $user_id = mt_rand(00000, 99999);
        $usercheck = User::select("*")
            ->where("email", "=", $user_email)
            ->get();
        //if($Licenses_limit>$count_licenses){
        if (count($usercheck) == 0) {
            $user = new User();
            $user->Process_name = $Process_name;
            $user->username = $username;
            $user->user_id = $user_id;
            $user->name = $user_name;
            $user->email = $user_email;
            $user->password = Hash::make($user_pass);
            //$user->password = $user_pass;
            $user->user_type = $user_type;
            $user->department_name = $department_name;
            $user->remember_token = $token;
            $user->chat_status = "Offline";
            $user->status_live = "success";
            $user->Process_name = "Ticket";
            $user->status = "1";
            $user->save();

            $arr = [
                "msg" => "add successfully",
                "response_code" => "3001",
            ];
        } else {
            $arr = [
                "msg" => "Already add",
                "response_code" => "2001",
            ];
        }
        return response()->json($arr);
    }

    public function specialusersdel(Request $request)
    {
        $id = $request->id;
        User::where("id", $id)->delete();

        return redirect("/admin/specialuser")->with(
            "flash_message_success",
            "Successfull Delete"
        );
    }

    public function viewImage()
    {
        $user_data = User::select("*");

        return view("admin/userscontrol", compact("user_data"));
    }

    public function user_image(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->userid;
            $data = $request->file("file");
            $extension = $data->getClientOriginalExtension();
            $filename =
                "usermina" . "_profilepic" . date("YmdHis") . "." . $extension; // renameing image
            $path = public_path("/users");

            $usersImage = public_path("/users/{$filename}"); // get previous image from folder

            if (File::exists($usersImage)) {
                // unlink or remove previous image from folder
                unlink($usersImage);

                User::select("*")
                    ->where("id", $id)
                    ->update(["images" => $filename]);
            } else {
                //                dd('File is not exists.');
                //$pp='nofileexist';
                User::select("*")
                    ->where("id", $id)
                    ->update(["images" => $filename]);
                // DB::table('emp_history')->insert(['emp_id' => '199', 'emp_img' => $filename]);
            }

            $upload_success = $data->move($path, $filename);

            return response()->json([
                "success" => "done",
                "valueimg" => $data,
            ]);
        }
    }

    public function get_permissionfetch(Request $request)
    {
        if ($request->ajax()) {
            $search = $request->get("search");

            $data = Permissionlist::select(
                "create_ticket_permission",
                "manage_ticket_permission",
                "create_customer_permission",
                "customer_list_permission",
                "knowledge_base_permission",
                "email_permission",
                "report_permission",
                "process_permission",
                "user_permission",
                "access_permission",
                "status_permission",
                "category_permission",
                "country_state_city_permission",
                "product_permission",
                "department_permission",
                "rca_permission"
            )
                ->where("group_name", "=", $search)
                ->where("group_name", "!=", "")
                ->get();

            //$search_arr = array();

            //if (count($data)>0) {
            //$search_arr = $data;
            /*foreach ($data as $row)
                {
                 $product = $row->product;
                 $search_arr[] = array("product" => $product);
                }*/

            echo json_encode($data);
            //}
        }
    }

    public function memberfetch(Request $request)
    {
        if ($request->ajax()) {
            $search = $request->get("search");

            $data = User::select("*")
                ->where("user_type", "=", $search)
                ->get();

            echo json_encode($data);
        }
    }

    public function showgrouplist()
    {
        $group = Userrole::select("*")
            ->where("user_role", "!=", "Admin")
            ->get();
        return view("/admin/grouplist")->with("group", $group);
    }

    public function group_data_fatch(Request $request)
    {
        $id = $request->id;
        $group = Userrole::find($id);
        $groupname = $group->user_role;
        $arr = [
            "id" => $id,
            "groupname" => $groupname,
        ];
        echo json_encode($arr);
    }

    public function group_edit(Request $request)
    {
        $id = $request->editid;
        $user_roles = $request->user_roles;
        $edit_name = $request->edit_name;

        $user = User::select("*")
            ->where("user_type", "=", $user_roles)
            ->get();
        foreach ($user as $key => $value) {
            $updateuser_roles = User::where(
                "user_type",
                "=",
                $edit_name
            )->update(["user_type" => $user_roles]);
        }
        $updateuser_roles = Userrole::where("id", "=", $id)->update([
            "user_role" => $user_roles,
        ]);

        if ($updateuser_roles) {
            $arr = ["msg" => "Successfull Update"];
        } else {
            $arr = ["msg" => "UnSuccessfull Update"];
        }
        return response()->json($arr);
    }

    public function get_groupdel(Request $request)
    {
        $id = $request->id;
        $Status = Userrole::find($id);
        $Status->delete();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/grouplist")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        } else {
            return redirect("/user/grouplist")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }

    public function statuscase(Request $request)
    {
        $status_tb = $request->status;

        $usersQuery = Ticket::query();
        $role = Auth::user()->user_type;
        $status_tb = !empty($_GET["status_tb"]) ? $_GET["status_tb"] : "";
        if ($status_tb) {
            $usersQuery->whereRaw(
                "(process_ticket.status) = '" . $status_tb . "' "
            );
        }
        if ($role == "Admin") {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "owner",
                    "created_by",
                    "status"
                )
                ->orderBy("id", "DESC");
        } elseif ($role == "Support" || "created_by" == Auth::user()->name) {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "owner",
                    "created_by",
                    "status"
                )
                ->orderBy("id", "DESC");
        } else {
            $users = $usersQuery
                ->select(
                    "id",
                    "ticket_number",
                    "mobile",
                    "customer_name",
                    "owner",
                    "created_by",
                    "status"
                )
                ->where("owner", "=", $owner_name_assign)
                ->orderBy("id", "DESC");
        }

        return datatables()
            ->of($users)
            ->addColumn("checkbox", function ($data) {
                if ($data->status == "Open") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Resolve") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Hold") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Working") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                        $data->id .
                        '"    name="chk[]" />';
                } elseif ($data->status == "Closed") {
                    return '<input type="checkbox" onchange="valueChanged()" class="chk_show" value="' .
                        $data->id .
                        '" disabled="disabled"   name="chk[]" />';
                }
            })

            ->addColumn("action", function ($users) {
                if (Auth::user()->user_type == "Admin") {
                    $viewUrl = url("/admin/ManagesTicketdetails/" . $users->id);
                } else {
                    $viewUrl = url("/user/ManagesTicketdetails/" . $users->id);
                }
                $btn =
                    '<a href="' .
                    $viewUrl .
                    '" data-toggle="tooltip" data-original-title="View" class="btn btn-xs btn-primary btn-sm"><i  class="fa fa-eye" aria-hidden="true" title="View"></i> </a>';
                return $btn;
            })
            ->rawColumns(["checkbox", "action"])
            ->make(true);
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/grouplist")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        } else {
            return redirect("/user/grouplist")->with(
                "flash_message_error",
                "Successfully Delete"
            );
        }
    }

    public function transfer_ticket_department(Request $request)
    {
        $id = $request->id;
        $Ticket = Ticket::find($id);
        $ticket_number = $Ticket->ticket_number;
        $arr = [
            "id" => $id,
            "ticket_number" => $ticket_number,
        ];

        return response()->json($arr);
    }

    public function change_department(Request $request)
    {
        $data=$request->all();
       // echo '<pre>';
         //print_r($data);die();
        $transferid = $request->transferid;
        $ticket_number = $request->ticket_number;
        $group_name = $request->group_name;
        $Notes = $request->Notes;
        $user_name = Auth::user()->name;
        //////////////////////////////////////////////////////
        $Ticket = Ticket::find($transferid);
        $status = $Ticket->status;
        $sub_status = $Ticket->sub_status;

        
        $data = User::select("*")
            ->where("user_type", "=", $group_name)
            ->where("type", "=", "Special")
            ->get();
        //echo '<pre>';
        //print_r($data);die();
        foreach ($data as $key => $value) {
            $owner = $value->name;
            $updateticket = Ticket::where("id", "=", $transferid)->update([
                "department" => $group_name,
                "owner" => $owner,
                "owner" => 'Transfer',
                "transfer_case" => 'Transfer'
            ]);

            $logupdate=Logfiles::where("ticket_number", "=", $ticket_number)->where('case_status','Ticket Created')->update(["note" => $Notes ] );
        }

        /////////////////////////////////////////////////////

        $feadback =
            "Ticket has been changed by " .
            $group_name .
            " . the ticket Number is " .
            $ticket_number .
            "";
        $system_remark =
            "Ticket has been changed by " . $group_name . " by " . $user_name;
        $case_status = "Ticket Transfer";

        $user_id = Auth::user()->user_id;
        $user_name = Auth::user()->name;
        $Logfiles = new Logfiles();
        $Logfiles->ticket_number = $ticket_number;
        $Logfiles->process_name = "HISTORY";
        $Logfiles->system_remark = $system_remark;
        $Logfiles->case_status = $case_status;
        $Logfiles->feadback = $feadback;
        $Logfiles->user_id = $user_id;
        $Logfiles->user_name = $user_name;
        $Logfiles->status = $status;
        $Logfiles->owner = "Admin";
        $Logfiles->sub_status = $sub_status;
        $Logfiles->save();
        if (Auth::user()->user_type == "Admin") {
            return redirect("/admin/ticketlist");
        } else {
            return redirect("/user/ticketlist");
        }
    }

    public function userchangepassword(Request $request)
    {
        return view("admin/userpassword");
    }

    public function get_userchangepassword(Request $request)
    {
        $data = $request->all();
        $email = $data["email"];
        $result = User::select("*")
            ->where("email", "=", $data["email"])
            ->get();
        if (count($result) > 0) {
            $user = User::select("*")
                ->where("email", "=", $data["email"])
                ->first();

            $result = [
                "id" => $user["id"],
                "name" => $user["name"],
            ];
            Mail::to($email)->send(new Userresetpassword($result));
            return redirect("user/userpassword")->with(
                "success",
                "Successfully Send mail. please Reset Password"
            );
        } else {
            return redirect("user/userpassword")->with(
                "error",
                "your email does not exit my database. please try again later"
            );
        }
    }

    public function userresetpassword(Request $request)
    {
        $id = $request->id;
        return view("admin/userresetpassword")->with("id", $id);
    }

    public function newpassset(Request $request)
    {
        $data = $request->all();

        $id = $data["id"];
        /* $validator = Validator::make($data, [
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            ]);*/
        if ($data["password"] == $data["password_confirmation"]) {
            // $validator->validate();

            $result = User::where("id", $id)->update([
                "password" => Hash::make($data["password"]),
            ]);
            if ($result) {
                return redirect("user/userpassword")->with(
                    "success",
                    __("Successfully Change Password. Please login Again!")
                );
                //return view('streamshow');
            } else {
                return redirect("user/userpassword")->with(
                    "error",
                    __("There has been an error!")
                );
            }
        } else {
            return redirect("user/userresetpassword/" . $id)->with(
                "success",
                __("your password didn't match. please try again!")
            );
        }
    }

    public function get_totalticket(Request $request)
    {

        //echo Auth::user()->user_type;die();
        //echo $request->sessionid;
        //echo $request->owner;
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////
            $totalticket = Ticket::select("*")->get();
            $totalcount = count($totalticket);
            ////////////////New////////////////////
            $Newticket = Ticket::select("*")
                ->where("status", "New")
                ->get();
            $Newticket = count($Newticket);
            ////////////////Open////////////////////
            $openticket = Ticket::select("*")
                ->where("status", "Open")
                ->get();
            $openticket = count($openticket);
            ////////////////Closed////////////////////
            $Closedticket = Ticket::select("*")
                ->where("status", "Closed")
                ->get();
            $Closedticket = count($Closedticket);
            ////////////////Hold////////////////////
            $Holdticket = Ticket::select("*")
                ->where("status", "Hold")
                ->get();
            $Holdticket = count($Holdticket);
            ////////////////Working////////////////////
            $Workingticket = Ticket::select("*")
                ->where("status", "Follow-up")
                ->get();
            $Workingticket = count($Workingticket);
            return response()->json([
                "totalcount" => $totalcount,
                "Newticket" => $Newticket,
                "openticket" => $openticket,
                "Closedticket" => $Closedticket,
                "Holdticket" => $Holdticket,
                "Workingticket" => $Workingticket,
            ]);
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $totalticket = Ticket::select("*")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $totalcount = count($totalticket);
                ////////////////New////////////////////
                $Newticket = Ticket::select("*")
                    ->where("status", "New")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $Newticket = count($Newticket);
                ////////////////Open////////////////////
                $openticket = Ticket::select("*")
                    ->where("status", "Open")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $openticket = count($openticket);
                ////////////////Closed////////////////////
                $Closedticket = Ticket::select("*")
                    ->where("status", "Closed")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $Closedticket = count($Closedticket);
                ////////////////Hold////////////////////
                $Holdticket = Ticket::select("*")
                    ->where("status", "Hold")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $Holdticket = count($Holdticket);
                ////////////////Working////////////////////
                $Workingticket = Ticket::select("*")
                    ->where("status", "Follow-up")
                    ->where("department", Auth::user()->user_type)
                    ->get();
                $Workingticket = count($Workingticket);
                return response()->json([
                    "totalcount" => $totalcount,
                    "Newticket" => $Newticket,
                    "openticket" => $openticket,
                    "Closedticket" => $Closedticket,
                    "Holdticket" => $Holdticket,
                    "Workingticket" => $Workingticket,
                ]);
            } else {
                /////////////////Total////////////////////
                $totalticket = Ticket::select("*")
                    ->where("owner", "=", Auth::user()->name)
                    ->get();
                $totalcount = count($totalticket);
                ////////////////New////////////////////
                $Newticket = Ticket::select("*")
                    ->where("status", "New")
                    ->get();
                $Newticket = count($Newticket);
                ////////////////Open////////////////////
                $openticket = Ticket::select("*")
                    ->where("status", "Open")
                    ->where("owner", "=", Auth::user()->name)
                    ->get();
                $openticket = count($openticket);
                ////////////////Closed////////////////////
                $Closedticket = Ticket::select("*")
                    ->where("status", "Closed")
                    ->where("owner", "=", Auth::user()->name)
                    ->get();
                $Closedticket = count($Closedticket);
                ////////////////Hold////////////////////
                $Holdticket = DB::table("process_ticket")
                    ->select("*")
                    ->where("status", "Hold")
                    ->where("owner", "=", Auth::user()->name)
                    ->get();
                $Holdticket = count($Holdticket);
                ////////////////Working////////////////////
                $Workingticket = DB::table("process_ticket")
                    ->select("*")
                    ->where("status", "Follow-up")
                    ->where("owner", "=", Auth::user()->name)
                    ->get();
                $Workingticket = count($Workingticket);

                return response()->json([
                    "totalcount" => $totalcount,
                    "Newticket" => $Newticket,
                    "openticket" => $openticket,
                    "Closedticket" => $Closedticket,
                    "Holdticket" => $Holdticket,
                    "Workingticket" => $Workingticket,
                ]);
            }
        }
    }

    public function get_statustotal(Request $request)
    {
        $status = $request->status;
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////
            //if($status=='total'){
            $totalticket = Ticket::select("*")->limit(100)->get();
            return response()->json($totalticket);
            //}
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $totalticket = Ticket::select("*")
                    ->where("department", Auth::user()->user_type)
                    ->limit(100)
                    ->get();
                return response()->json($totalticket);
            } else {
                $totalticket = Ticket::select("*")
                    ->where("owner", "=", Auth::user()->name)
                    ->limit(100)
                    ->get();
                return response()->json($totalticket);
            }
        }
    }

    public function get_statusopen(Request $request)
    {
        $status = $request->status;
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////

            $openticket = Ticket::select("*")
                ->where("status", $status)->orderBy("id", "DESC")
                ->limit(100)
                ->get();
            return response()->json($openticket);
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $openticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("department", Auth::user()->user_type)->orderBy("id", "DESC")
                    ->limit(100)
                    ->get();
                return response()->json($openticket);
            } else {
                $openticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("owner", "=", Auth::user()->name)->orderBy("id", "DESC")
                    ->limit(100)
                    ->get();
                return response()->json($openticket);
            }
        }
    }

    public function get_statusclosed(Request $request)
    {
        $status = $request->status;
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////
            $Closedticket = Ticket::select("*")
                ->where("status", $status)
                ->limit(100)
                ->get();
            return response()->json($Closedticket);
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $Closedticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("department", Auth::user()->user_type)
                    ->limit(100)
                    ->get();
                return response()->json($Closedticket);
            } else {
                $Closedticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("owner", "=", Auth::user()->name)
                    ->limit(100)
                    ->get();
                return response()->json($Closedticket);
            }
        }
    }

    public function get_statushold(Request $request)
    {
        $status = $request->status;
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////
            $holdticket = Ticket::select("*")
                ->where("status", $status)->orderBy("id", "DESC")
                ->get();
            return response()->json($holdticket);
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $holdticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("department", Auth::user()->user_type)->orderBy("id", "DESC")
                    ->get();
                return response()->json($holdticket);
            } else {
                $holdticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("owner", "=", Auth::user()->name)->orderBy("id", "DESC")
                    ->get();
                return response()->json($holdticket);
            }
        }
    }

    public function get_statusworking(Request $request)
    {
        $status = $request->status;
       
        if (Auth::user()->user_type == "Admin") {
            /////////////////Total////////////////////
            $Workingticket = Ticket::select("*")
                ->where("status", $status)->orderBy("id", "DESC")
                ->get();
            $findduedate = Logfiles::select("*")->where('ticket_number',)->get();    
            return response()->json([
                     'Workingticket' => $Workingticket,
                      "findduedate" => $findduedate
                    ]
            );
        } else {
            if (Auth::user()->type == "Special") {
                /////////////////Total////////////////////
                $Workingticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("department", Auth::user()->user_type)->orderBy("id", "DESC")
                    ->get();
                $findduedate = Logfiles::select("*")->where('ticket_number',)->get();     
                return response()->json([
                     'Workingticket' => $Workingticket,
                      "findduedate" => $findduedate
                    ]);
            } else {
                $Workingticket = Ticket::select("*")
                    ->where("status", $status)
                    ->where("owner", "=", Auth::user()->name)->orderBy("id", "DESC")
                    ->get();
                $findduedate = Logfiles::select("*")->where('ticket_number',)->get();     
                return response()->json([
                     'Workingticket' => $Workingticket,
                      "findduedate" => $findduedate
                    ]);
            }
        }
    }

    public function get_new_ticket_check(Request $request)
    {
        $owner = $request->owner;
        $currentdate = date("Y-m-d", time());
        $dt = $currentdate;
        $newticketcheck = Ticket::select("*")
            ->where("status", "!=", "Closed")
            ->where("owner", "=", Auth::user()->name)
            ->orderBy("id", "DESC")
            ->where("noti_read", "=", 0)
            //->whereBetween('created_date', [$dt.' 00:00:00',$dt.' 23:59:59'])
            ->get();

        return response()->json($newticketcheck);
    }
    public function get_realtime()
    {
        if (Auth::user()->user_type == "Admin") {
            $user = User::select("name")
                ->where("user_type", "!=", "Admin")
                ->where("user_type", "!=", "customer")
                ->get();
        } else {
            if (Auth::user()->type == "Special") {
                $user = User::where("user_type", "!=", "customer")
                    ->where("department_name", Auth::user()->user_type)
                    ->get();
            } else {
                $user = User::where("user_type", "!=", "customer")
                    ->where("name", "=", Auth::user()->name)
                    ->get();
            }
        }
        return view("admin/realtime")->with("user", $user);
    }

    public function get_realtime_agent_login(Request $request)
    {
        $currentTime = date("Y-m-d");
        $currentTime = $currentTime . " " . "23:59:59";
        $onedayagoTime = date("d");
        $yearmonth = date("Y-m");
        $onedayagoTime = $onedayagoTime - 1;
        $onedayagoTimecul =
            $yearmonth . "-" . $onedayagoTime . " " . "00:00:00";

        if (Auth::user()->user_type == "Admin") {
            $userlogin = User::where("login_status", "=", 1)
                ->where("id", "!=", "1")
                ->where("user_type", "!=", "customer")
                ->get();
        } else {
            if (Auth::user()->type == "Special") {
                $userlogin = User::where("login_status", "=", 1)
                    ->where("user_type", "!=", "customer")
                    ->where("department_name", Auth::user()->user_type)
                    ->get();
            } else {
                $userlogin = User::where("login_status", "=", 1)
                    ->where("user_type", "!=", "customer")
                    ->where("name", "=", Auth::user()->name)
                    ->get();
            }
        }
        $output = "";
        $i = 1;
        foreach ($userlogin as $key => $value) {
            ////////////////Open////////////////////
            $openticket = Ticket::select("*")
                ->where("status", "Open")
                ->where("owner", "=", $value->name)
                ->whereBetween("created_date", [
                    $onedayagoTimecul,
                    $currentTime,
                ])
                ->get();
            //echo  $openticket;die();
            $openticket = count($openticket);

            ////////////////Closed////////////////////
            $Closedticket = Ticket::select("*")
                ->where("status", "Closed")
                ->where("owner", "=", $value->name)
                ->whereBetween("created_date", [
                    $onedayagoTimecul,
                    $currentTime,
                ])
                ->get();
            $Closedticket = count($Closedticket);
            ////////////////Hold////////////////////
            $Holdticket = Ticket::select("*")
                ->where("status", "Hold")
                ->where("owner", "=", $value->name)
                ->whereBetween("created_date", [
                    $onedayagoTimecul,
                    $currentTime,
                ])
                ->get();
            $Holdticket = count($Holdticket);
            ////////////////Working////////////////////
            $Workingticket = Ticket::select("*")
                ->where("status", "Working")
                ->where("owner", "=", $value->name)
                ->whereBetween("created_date", [
                    $onedayagoTimecul,
                    $currentTime,
                ])
                ->get();
            $Workingticket = count($Workingticket);

            $dt = date("d M Y", strtotime($value->session_in));
            $time = date("h:i A", strtotime($value->session_in));
            if ($i % 2 == 0) {
                $output .=
                    '<tr style="background: #F5FFFA;"><td><b>' .
                    $i .
                    "</b></td><td><b>" .
                    ucwords($value->name) .
                    "</b></td><td><b>" .
                    $dt .
                    "  at " .
                    $time .
                    "</b></td><td>" .
                    $openticket .
                    "</td><td>" .
                    $Closedticket .
                    "</td><td>" .
                    $Holdticket .
                    "</td><td>" .
                    $Workingticket .
                    "</td></tr>";
            } else {
                $output .=
                    '<tr style="background: #66CDAA;"><td><b>' .
                    $i .
                    "</b></td><td><b>" .
                    ucwords($value->name) .
                    "</b></td><td><b>" .
                    $dt .
                    "  at " .
                    $time .
                    "</b></td><td>" .
                    $openticket .
                    "</td><td>" .
                    $Closedticket .
                    "</td><td>" .
                    $Holdticket .
                    "</td><td>" .
                    $Workingticket .
                    "</td></tr>";
            }
            $i++;
        }
        return $output;
    }

    public function reportshow(Request $request)
    {
        return view("/admin/reportshow");
    }

    public function get_reportshow(Request $request)
    {
        $data = $request->all();
        //print_r($data);die();
        //if($data['start_date']==''){
        $start_date = $data["start_date"] . " " . "00:00:00";
        $end_date = $data["end_date"] . " " . "23:59:59";
        //$status = $data["Status"];
        //$Ticketno = $data["Ticketno"];
        $search = Ticket::select("*")
            ->whereBetween("created_date", [$start_date, $end_date])
            //->orwhere("status", "=", $status)
            //->orwhere("ticket_number", "=", $Ticketno)
            ->get();
        //}elseif($data['Ticketno']==''){

        //echo $data['Status'];die();
        //$search = Ticket::select('*')->where('status','=', $data['Status'])->get();
        //}
       

        return view("admin/reportshow")->with(["search"=> $search, 'start_date'=>$start_date, 'end_date'=> $end_date ]);
    }

public function export(Request $request)
{
    $from_date=$request->fdate;
    $to_date=$request->ldate;
    return Excel::download(new TicketReport($from_date,$to_date), 'report.csv');
}

    public function get_session_check_agent(Request $request)
    {
        $currdt = date("Y-m-d");
        $id = $request->id;
        $sessioncheck = Userhistory::select("updated_at")
            ->where("uid", "=", $id)
            ->where("session_in_date", "=", $currdt)
            ->first();
        $date = $sessioncheck["updated_at"];
        $htime = date("h", strtotime($date));
        $mtime = date("i", strtotime($date));
        $chtime = date("h", time());
        $cmtime = date("i", time());
        $mincheck = $cmtime - $mtime;
        if ($mincheck > 120 && ($htime = $chtime)) {
            $sessionupdate = Userhistory::where("uid", "=", Auth::user()->id)
                ->where("session_in_date", "=", $currdt)
                ->update([
                    "session_out" => Carbon::now()->toDateTimeString(),
                    "updated_at" => Carbon::now()->toDateTimeString(),
                ]);
            Auth::logout();
            Session::flush();
            //return redirect('/user')->with(['flash_message_success'=>'Logged out Successfully','user'=>'user']);
        } else {
            echo json_encode($mincheck);
        }
        //echo json_encode($mincheck);
    }

    public function get_user_entry_record(Request $request)
    {
        $data = $request->all();
        //$month = $data["month"];
        //$yearcurr = date("Y");
        //$monthcurr = date("m");
        //$dt = $yearcurr . "-" . $month; //.'-'.$monthcurr;
        //$dateS = Carbon::now()->subMonths(6);
        //print_r(Carbon::now()->month);die();
        $output = "";
        if ($data["startdate"] == "" && $data["enddate"] == "") {
            $userist = Userhistory::whereMonth(
                "created_at",
                Carbon::now()->month
            )
                ->where("name", $data["user"])
                ->get();
        } else {
            $startdate = $data["startdate"] . " " . "00:00:00";
            $enddate = $data["enddate"] . " " . "23:59:59";
            if (Auth::user()->user_type == "Admin") {
                $userist = Userhistory::whereBetween("created_at", [
                    $startdate,
                    $enddate,
                ])->get();
            } else {
                $userist = Userhistory::whereBetween("created_at", [
                    $startdate,
                    $enddate,
                ])
                    ->where("name", Auth::user()->name)
                    ->get();
            }
        }

        $i = 1;
        if (count($userist) > 0) {
            foreach ($userist as $key => $value) {
                $dt1 = date("d M Y h:i A", strtotime($value->created_at));

                if (empty($value->session_out)) {
                    $dt2 = "No Logout User";
                } else {
                    $dt2 = date("d M Y h:i A", strtotime($value->session_out));
                }

                if ($i % 2 == 0) {
                    $output .=
                        '<tr style="background: #F5FFFA;"><td><b>' .
                        $i .
                        "</b></td><td><b>" .
                        ucfirst($value->name) .
                        "</b></td><td><b>" .
                        $dt1 .
                        "</b></td><td><b>" .
                        $dt2 .
                        "</b></td></tr>";
                } else {
                    $output .=
                        '<tr style="background: #66CDAA;"><td><b>' .
                        $i .
                        "</b></td><td><b>" .
                        ucfirst($value->name) .
                        "</b></td><td><b>" .
                        $dt1 .
                        "</b></td><td><b>" .
                        $dt2 .
                        "</b></td></tr>";
                }
                $i++;
            }
        } else {
            $output .= "No Record found";
        }
        return $output;
        //echo json_encode($userist);
    }


  public function get_fetch_record_new()
  {
      DB::table('table_field_list_old')->limit(1)->delete();
      
  }



  public function get_fetch_record()
    {
die;
        $emailaccess=Eaccess::select('*')->where('id','=',1)->first();
        /* gmail connection,with port number 993 */
        //$host = "{imappro.zoho.com:993/imap/ssl/novalidate-cert}INBOX";
        //$host = "{imap.secureserver.net:993/imap/ssl/novalidate-cert}INBOX";
        //$user = 'eticket@vert-age.com';
        //$password = 'Xeno@123';
        //$password = 'Biwshare2022$';
        $host = $emailaccess['host'];
        $user = $emailaccess['email'];
        $password = $emailaccess['pass'];

        /* Establish a IMAP connection */
        $conn = imap_open($host, $user, $password) or
            die("unable to connect: " . imap_last_error());

        //imap_open, imap_headers, imap_num_msg, imap_header, imap_body, imap_close
        //$headers=imap_headers($conn);
        //$last = imap_num_msg($conn);
        //$single_mail = imap_header($conn, $last);
        //$mboxCheck = imap_num_msg($conn);
        //$showMessages = 420;
        //$ss = imap_uid($conn, 1);
        //$MC = imap_check($conn);
        $date = date("j F Y");

        //$result = imap_search($conn,'ON "'.$date.'"' );
        $result = imap_search($conn, "New");
        //print_r($result);die();
        $path = public_path("/attachment/");
        $email_cc = "";
        if (is_array($result)) {
            foreach ($result as $key => $value) {
                $headers = imap_headerinfo($conn, $value);
                $fetch_overview = imap_fetch_overview($conn, $value);
                //print_r($fetch_overview);die();
                $email_to = $this->get_email($headers->to);
                if (!empty($headers->cc)) {
                    $email_cc = $this->get_email($headers->cc);
                }
                //$email_contact=$this->get_email_contact($headers->to);

                $subject = $headers->subject;
                $from = $fetch_overview[0]->from;

                $date = $headers->date;
                //$to=$headers->to;
                $message_id = $fetch_overview[0]->message_id;
                if (empty($fetch_overview[0]->references)) {
                    $references = null;
                } else {
                    $references = $fetch_overview[0]->references;
                }
                if (empty($fetch_overview[0]->in_reply_to)) {
                    $in_reply_to = null;
                } else {
                    $in_reply_to = $fetch_overview[0]->in_reply_to;
                }

                $size = $headers->Size;
                $customer = $fetch_overview[0]->from;
                $uid = $fetch_overview[0]->uid;
                $msgno = $fetch_overview[0]->msgno;
                $recent = $fetch_overview[0]->recent;
                $flagged = $fetch_overview[0]->flagged;
                $answered = $fetch_overview[0]->answered;
                $deleted = $fetch_overview[0]->deleted;
                $seen = $fetch_overview[0]->seen; 
                $draft = $fetch_overview[0]->draft;
                $udate = $fetch_overview[0]->udate;
                $str_name = explode("<", $customer);
                $customer_name = $str_name[0];

                //$autoresponse = preg_replace("/[>]/", "", $str_name[1]);
                $message = $this->getBody($uid, $conn);

                ////////////////////////////////////////////////////////////////////////////////////////
                $message_count = imap_num_msg($conn);
                for ($m = 1; $m <= $message_count; $m++) {
                    $header = imap_header($conn, $m);

                    $structure = imap_fetchstructure($conn, $m);

                    $attachments = [];
                    if (isset($structure->parts) && count($structure->parts)) {
                        for ($i = 0; $i < count($structure->parts); $i++) {
                            $attachments[$i] = [
                                "is_attachment" => false,
                                "filename" => "",
                                "name" => "",
                                "attachment" => "",
                            ];

                            if ($structure->parts[$i]->ifdparameters) {
                                foreach (
                                    $structure->parts[$i]->dparameters
                                    as $object
                                ) {
                                    if (
                                        strtolower($object->attribute) ==
                                        "filename"
                                    ) {
                                        $attachments[$i][
                                            "is_attachment"
                                        ] = true;
                                        $attachments[$i]["filename"] =
                                            $object->value;
                                    }
                                }
                            }

                            if ($structure->parts[$i]->ifparameters) {
                                foreach (
                                    $structure->parts[$i]->parameters
                                    as $object
                                ) {
                                    if (
                                        strtolower($object->attribute) == "name"
                                    ) {
                                        $attachments[$i][
                                            "is_attachment"
                                        ] = true;
                                        $attachments[$i]["name"] =
                                            $object->value;
                                    }
                                }
                            }

                            if ($attachments[$i]["is_attachment"]) {
                                $attachments[$i]["attachment"] = imap_fetchbody(
                                    $conn,
                                    $m,
                                    $i + 1
                                );
                                if ($structure->parts[$i]->encoding == 3) {
                                    // 3 = BASE64
                                    $attachments[$i][
                                        "attachment"
                                    ] = base64_decode(
                                        $attachments[$i]["attachment"]
                                    );
                                } elseif (
                                    $structure->parts[$i]->encoding == 4
                                ) {
                                    // 4 = QUOTED-PRINTABLE
                                    $attachments[$i][
                                        "attachment"
                                    ] = quoted_printable_decode(
                                        $attachments[$i]["attachment"]
                                    );
                                }
                            }
                        }
                    }
                    //print_r($attachments);die();
                    $filename = "";
                    foreach ($attachments as $key => $attachment) {
                        if (!empty($attachment["attachment"])) {
                            //$name = $attachment['name'];
                            $folder = "attachment";
                            $filename = $attachment["name"];
                            if (empty($filename)) {
                                $filename = $attachment["filename"];
                            }

                            //if(empty($filename)) $filename = time() . ".dat";
                            $folder = $path;
                            $url = $udate . "-" . $filename;
                            $fp = fopen(
                                $folder . "/" . $udate . "-" . $filename,
                                "w+"
                            );
                            fwrite($fp, $attachment["attachment"]);
                            fclose($fp);
                        }
                    }
                }
            }

            $ref = explode(" ", $references);
            //echo $message_id.'|'.$references.'|'.$in_reply_to;
            $get = Ticket::where("message_id","=",$ref[0])->orwhere("message_id1","=",$ref[0])->get();
            if(count($get)==1){
                foreach($get as $ticket_no){
                    $ticno=$ticket_no->ticket_number;

                    
                }

            }else{

            $maxValue = Ticket::orderBy("id", "desc")->value("id");
            $maxValue = $maxValue + 1;
            $ticno = date("Ymd") . $maxValue;
                }
           
            $result = Email::select("*")
                    ->where("uid", "=", $uid)
                    ->get();
          

            if (count($result) == 0){
                          
                    $Email = new Email();
                    $Email->uid = $uid;
                    $Email->ticket_number = $ticno;
                    $Email->subject = $subject;
                    $Email->from1 = $from;
                    $Email->to1 = $email_to;
                    $Email->cc_address = $email_cc;
                    $Email->date1 = "";
                    $Email->message_id = $message_id;
                    $Email->references = $references;
                    $Email->in_reply_to = $in_reply_to;
                    $Email->message = $message;
                    $Email->size = $size;
                    $Email->msgno = $msgno;
                    $Email->recent = $recent;
                    $Email->flagged = $flagged;
                    $Email->answered = $answered;
                    $Email->deleted = $deleted;
                    $Email->fromaddress = $from;
                    $Email->seen = $seen;
                    $Email->draft = $draft;
                    $Email->udate = $udate;
                    $Email->page = "IN";
                    $Email->save();

                    if (!empty($filename)) {
                        $Email_attachment = new Email_attachment();
                        $Email_attachment->uid = $uid;
                        $Email_attachment->file = $filename;
                        $Email_attachment->save();
                    }
                }
               

               $result1 = Email::select("*")
                    ->where("uid", "=", $uid)
                    ->whereNull("references")
                    ->get();

             if (count($result1) == 1) {
                   
                    $cust_id = mt_rand(100000, 999999);
                    $email_id = $from;
                    $owner = "Admin";
                    $customer_name;
                    ////////////////////////////////////////////////
                    
                    date_default_timezone_set("Asia/Kolkata"); // change according timezone
                    $currentTime = date("Y-m-d h:i:s", time());
                    $updatedTime = date("Y-m-d h:i:s", time());
                   
                    $dt = date("m-d-Y");
                    $user_name = 'Admin';
                   

                    $custmaxid = Ticket::orderBy("id", "desc")->value("id");
                    $custmaxid = $custmaxid + 1;
                    $customer_id = date("Ymd") . $custmaxid;

                    $customercheck = Customer::where("email_id","=",$email_id)->get();

                    if (count($customercheck) == 0) {
                        $Customer = new Customer();
                        $Customer->customer_id = $customer_id;
                        $Customer->owner = $owner;
                        $Customer->customer_name = $customer_name;
                        $Customer->email_id = $from;
                        $Customer->save();
                    }

                    $Ticket = new Ticket();
                    $Ticket->ticket_number = $ticno;
                    $Ticket->mobile = "";
                    $Ticket->uid = $uid;
                    $Ticket->email_id = $email_id;
                    $Ticket->customer_id = $customer_id;
                    $Ticket->customer_name = $customer_name;
                    $Ticket->message_id = $message_id; 
                    $Ticket->created_by = $customer_name;
                    $Ticket->created_at = $currentTime;
                    $Ticket->subject = $subject;
                    $Ticket->type = '';
                    $Ticket->category = "Software";
                    $Ticket->sub_category = "CRM";
                    $Ticket->status = "New";
                    $Ticket->sub_status = "New";
                    $Ticket->source = "Email";
                    $Ticket->source_value = "Email";
                    $Ticket->product = '';
                    $Ticket->tat = $currentTime;
                    $Ticket->voc = '';
                    $Ticket->department = "Support";
                    $Ticket->owner = $owner;
                    $Ticket->remarks = $subject;
                    $Ticket->updated_at = $updatedTime;
                    $Ticket->save();

                    $feadback =
                        "Ticket has been created . the ticket Number is " .
                        $ticno .
                        ".";
                    $system_remark =
                        " New ticket has been created by mail of " .
                        $customer_name;
                    $case_status = "Ticket Created";

                    $user_id = '1';
                    $user_name = 'Admin';
                    $Logfiles = new Logfiles();
                    $Logfiles->ticket_number = $ticno;
                    $Logfiles->process_name = "HISTORY";
                    $Logfiles->system_remark = $system_remark;
                    $Logfiles->case_status = $case_status;
                    $Logfiles->feadback = $feadback;
                    $Logfiles->user_id = $user_id;
                    $Logfiles->user_name = $customer_name;
                    $Logfiles->status = "New";
                    $Logfiles->owner = $owner;
                    $Logfiles->sub_status = "New";
                    $Logfiles->save();

                    $data = [
                        "ticno" => $ticno,
                        "customer_name" => $customer_name,
                        "feadback" => $feadback,
                        "system_remark" => $system_remark,
                        "user_name" => $user_name,
                        "status" => "Open",
                    ];

                    $email_to = explode(",", $email_to);
                    $arr = [
                        "msg" =>
                            "Service Request Generated Successfully. Your SR Number is #" .
                            $ticno.
                            "# ",
                        "response_code" => "200",
                    ];

                    echo json_encode($arr);
                }


           }
    }

   public function get_auto_reopen()
   {
      $Email = Email::select('*')->where('email_send','=', 0)->where('page','=','IN')->whereNull("references")->get();
            if(count($Email) > 0){
               $cc_address=''; 
            foreach ($Email as $key => $Emails) {
                
                 $email=$Emails->from1;
                 $str_name = explode("<", $email);
                 $customer_name = $str_name[0];
                
                $autoresponse = preg_replace("/[>]/", "", $str_name[1]);
                 
                //$subject=$Emails->subject;
                //$details=$Emails->message;
                $details = array(
                 'ticno'=> $Emails->ticket_number,
                 'customer_name' => $customer_name,
                 
               );

                //$cc_address=$Emails->cc_address; 
              /*  if (!empty($cc_address))
                  {
                   Mail::to($email)->cc($cc_address)->send(new Myreply($details,$subject));
                   $this->info('Every minutes has been sent successfully');
                  }else{*/
                   // Mail::to($autoresponse)->send(new CustomerMail($details));
                   //$this->info('Every minutes has been sent successfully');
                  //}

            Email::where('id',$Emails->id)->update([ 'email_send'=> 1 ]);
            }
    }


   }



    public function get_checkstatus(Request $request)
    {
        $id = $request->check;
        $task = Task::select("*")
            ->where("id", "=", $id)
            ->first();
        if ($task["work_status"] == 1) {
            Task::where("id", "=", $id)->update(["work_status" => "0"]);
            $arr = [
                "msg" => "Task is not Done!",
            ];
        } else {
            Task::where("id", "=", $id)->update(["work_status" => "1"]);
            $arr = [
                "msg" => "Task is Done!",
            ];
        }
        return response()->json($arr);
    }

    public function getBody($uid, $imap)
    {
        $body = $this->get_part($imap, $uid, "TEXT/HTML");
        // if HTML body is empty, try getting text body
        if ($body == "") {
            $body = $this->get_part($imap, $uid, "TEXT/PLAIN");
        }
        return $body;
    }

    public function get_part(
        $imap,
        $uid,
        $mimetype,
        $structure = false,
        $partNumber = false
    ) {
        if (!$structure) {
            $structure = imap_fetchstructure($imap, $uid, FT_UID);
        }
        if ($structure) {
            if ($mimetype == $this->get_mime_type($structure)) {
                if (!$partNumber) {
                    $partNumber = 1;
                }
                $text = imap_fetchbody($imap, $uid, $partNumber, FT_UID);
                switch ($structure->encoding) {
                    case 3:
                        return imap_base64($text);
                    case 4:
                        return imap_qprint($text);
                    default:
                        return $text;
                }
            }

            // multipart
            if ($structure->type == 1) {
                foreach ($structure->parts as $index => $subStruct) {
                    $prefix = "";
                    if ($partNumber) {
                        $prefix = $partNumber . ".";
                    }
                    $data = $this->get_part(
                        $imap,
                        $uid,
                        $mimetype,
                        $subStruct,
                        $prefix . ($index + 1)
                    );
                    if ($data) {
                        return $data;
                    }
                }
            }
        }
        return false;
    }

    public function get_mime_type($structure)
    {
        $primaryMimetype = [
            "TEXT",
            "MULTIPART",
            "MESSAGE",
            "APPLICATION",
            "AUDIO",
            "IMAGE",
            "VIDEO",
            "OTHER",
        ];

        if ($structure->subtype) {
            return $primaryMimetype[(int) $structure->type] .
                "/" .
                $structure->subtype;
        }
        return "TEXT/PLAIN";
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

    public function get_email_contact($email_cont)
    {
        $email_contact = [];
        foreach ($email_cont as $key => $value) {
            $email_contact[] = $value->mailbox . "@" . $value->host;
        }

        $email_contact = implode(",", $email_contact);

        return $email_contact;
    }

    public function get_searchcase(Request $request)
    {
        
    }
    public function get_status_new_add(Request $request)
      {
          

        $status = $request->status;
        $data=array('status'=>$status);
        $New_status=New_status::insert($data);
       if ($New_status) {
            $arr = [
                "msg" => "Status is add!",
                'status' => 200
            ];
        } else {
            $arr = [
                "msg" => "Status is add!",
                'status' => 400
            ];
        }
        return response()->json($arr);
      }  

   public function get_statuscase(Request $request)
   {
     $status=$request->status;
     $statuslist = Status::select("*")
            ->where("status", "=", $status)
            ->get();
     if (Auth::user()->user_type == "Admin") {
            return view("admin/showstatus_sub")->with('statuslist', $statuslist);
        } else {
            return view("user/showstatus_sub/".$status)->with('statuslist', $statuslist );
        }   
   }

   public function get_status_sub_edit(Request $request)
   {
      $data=$request->all();
      $status = Status::select("*")
            ->where("id", "=", $data['id'])
            ->get();
       
        return response()->json($status);         
   }

   public function get_findmail(Request $request)
   {
       $data=$request->all();
       //print_r($data);die(); 
       //echo $data['id'];die();

       if(!empty($data['id'])){
       $ticketid=Email::select('*')->where('id','=',$data['id'])->first();
      
       $status=Ticket::select('*')->where('ticket_number','=',$ticketid['ticket_number'])->get();
       
       foreach ($status as $key => $value) {
        $ref = explode(" ", $value->references);
         
        $email = Email::select("*")
                 ->where("ticket_number", "=", $value->ticket_number)
                 //->where('page','=','IN')
                 ->orderBy("id", "DESC")
                 ->limit('1')->get();  
       }
       
        $arr = [
                "status" => $status,
                'email' => $email
            ];


       return response()->json($arr);
       }
}


public function get_ticketthreeday(Request $request)
{
    $data=$request->all();
    //echo $data['dt'];die();
    if (Auth::user()->user_type == "Admin") {
    $result=Ticket::select("*")->where('status','!=','Closed')->whereDate('created_at','=',  $data['dt'])->orderby('id','Desc')->get();
    }else{
    $result=Ticket::select("*")->where('status','!=','Closed')->where('owner','=',Auth::user()->name)->whereDate('created_at','=',  $data['dt'])->orderby('id','Desc')->get();
    }
   
    return response()->json($result);
}

public function get_read_notifications(Request $request)
{
        $id=$request->id;
        $read=$request->read;
        $log_id=$request->logid;
        
        $Ticket = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();
        
        $ticketid=$Ticket['ticket_number'];
        $logid = Logfiles::select("*")
            ->where("ticket_number", "=", $ticketid)
            ->first();
        //echo '<pre>';    
        //echo $logid['id'];
        //die();
        $Ticketdetail = Ticket::select("*")
            ->where("id", "=", $id)
            ->first();

        $ticket_no=$Ticketdetail['ticket_number'];

        if($read!='' && $id!='')
        {
        $ticketread = Logfiles::where("id", "=", $log_id)->update(["noti_read" => 1]);
        $ticketupdate = Ticket::where("ticket_number", "=", $ticket_no)->update(["noti_read" => 1]);

        }
        //die();
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
        }


    
}

public function get_server_config()
   {
        $Config=Config::all();
        return view('admin/server_config')->with('Config', $Config);
   } 

  public function get_edit_mailconfigs($id)
   {
       $Config=Config::select('*')->where('id',$id)->first();
       return view('admin/edit-mailconfigs')->with('Config', $Config);
   } 

   public function post_server_config(Request $request)
   {
       
       $data=$request->all();
       
       $id=$data['id'];
       $host=$data['hostname'];
       $port=$data['port'];
       $server_config=$data['server_config'];
       $mode=$data['mode'];
       $user=$data['user'];
       $password=$data['password'];

       $Configupdate = Config::where("id", "=", $id)->update(["host" => $host, "port" => $port, "server_config" => $server_config, "mode" => $mode , "user" => $user, "password" => $password ]);
       $Config=Config::all();
       return view('admin/server_config')->with('Config', $Config);
   }
public function get_test()
{
    //echo 'gvhjgbh';die();
        $files = [
            public_path('files/160031367318.pdf'),
            public_path('files/1599882252.jpg')
        ];
        //echo '<pre>';
        //print_r($files);die();
  
        $details = [
            'title' => 'Ticket Managament System',
            'body' => 'This is for testing email using smtp',
            'files' => $files
        ];
         
        Mail::to('rathore.sunil23@gmail.com')->send(new MyTestMail($details));
         
        dd("Email is Sent.");
   
}

}
