<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Auth;
use Session;
use App\Models\User;
use App\Models\Agent;
use App\Models\Start_chat;


class AgentController extends Controller
{
    
public function login()
{
	 return view('/Agent/login');
}
public function dologin(Request $request)
{
           $data = $request->input();
           if (Auth::attempt(['email' => $data['email'], 'password' =>$data['password'],'type' => 'agent'])) {
                $request->session()->put('data', $request->input());
                if($request->session()->has('data'))
                  {
            $agent_id= Auth::user()->id;        
            $Chat = User::where('id',$agent_id)->update(['Isactive'=>'1']);        
            return redirect('/Agent/dashboard');
                  }  
            }else{
                //echo "failed"; die;
                return redirect('/Agent')->with('flash_message_error','Invalid Email or Password');
            }     

	
}
public function getalluser()
{
  //echo 'sunil';
  $user = Start_chat::select('*')->where('user_id','=', Auth::user()->id)
        ->orderBy('id', 'desc')->get();
       if(count($user) > 0)
        { 
       return response()->json($user);
        }else{
        $user='Customer Not avalible!';
       return response()->json($user);
         }     
         
}

public function closechat(Request $request)
{
   $sessid=$request->id;
   //Auth::user()->name;
   Start_chat::where('session_id','=',$sessid)
  ->update(['chat_status'=>'0']);
  return redirect('/Agent/dashboard');
}


 public function dashboard()
      {
       if(session()->has('data'))
        {
        $User = User::select('*')->where('type','!=','agent')
        ->where('type','!=','admin')
        ->orderBy('id', 'desc')->limit(30)->get();
        //$data = User::select('*')->where('type','!=','agent')->limit(1)->first();
        return view('/Agent/dashboard');//->with('user', $user);
        //return response()->json(['User'=>$User]);
        }else{
        session()->forget('data');
        return redirect('/Agent')->with('flash_message_error','Please login to access');
        }

       }

 public function logout(){
        //$user = Auth::user();
        // logout user
        //$userToLogout = User::find(5);
        //Auth::setUser($userToLogout);
  $agent_id= Auth::user()->id;
  Auth::user()->name;
  $Chat = User::where('id','=',$agent_id)
  ->where('Isactive', '=','1')
  ->update(['Isactive'=>'0']);
        Auth::logout();
        Session::flush();
        return redirect('/Agent')->with('flash_message_success','Logged out Successfully'); 
    }       

}
