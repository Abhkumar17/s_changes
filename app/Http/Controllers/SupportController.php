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

class SupportController extends Controller
{
   

    public function login(Request $request)
    {
         
        if($request->isMethod('post')){
            echo 'sunil';die();
            //$data = $request->input();
            //print_r($data);
            die();
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
                   //return redirect()->intended('/admin/dashboard');

                  return redirect('/support/dashboard');
                  }
                
            }else{
                  return redirect('/support')->with('flash_message_error','Invalid Username or Password');
            }  

         }
        if(session()->has('datas')){
           return redirect('/support/dashboard');
         }else{
        return view('support.login');
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
        return redirect('/support')->with('flash_message_success','Logged out Successfully'); 
    }
    public function dashboard(){
        if(session()->has('datas'))
        {
          //echo Auth::user()->id;
          //echo Auth::user()->name;die;
            $user=User::all();
            return view('/support/dashboard')->with('user',$user);
        }else{
            session()->forget('datas');
            return redirect('/support')->with('flash_message_error','Please login to access');
        }
        
    }
}
