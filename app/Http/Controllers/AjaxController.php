<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Auth;
use Session;
use File;
use App\Models\User;
use App\Models\ChatMessage;
use App\Models\Chat;
use App\Models\Notification;
use App\Models\Color;
use App\Models\Start_chat;

class AjaxController extends Controller
{

  public function livechating(Request $request)
  {
        //echo $request->receive_id;
         /*if(isset(Auth::user()->name)){
         echo  Auth::user()->id;
         }*/
         //die;
          //$data=$request->all();
          //print_r($data);die();

          $date =  date('Y-m-d H:i:s');
          $formatted_date =strtotime($date);    
          $formatted_date=date('Y-m-d H:i:s', $formatted_date-number_format(100));
         
          $sessionid = $request->sessionid;
          $receive_id = $request->receive_id;     
     
        $chatidfind = Start_chat::select('*')->where('chat_id','=',$sessionid)->get();
        if(count($chatidfind) > 0){
             $chat = Start_chat::where(function($chat) use ($sessionid,$receive_id){
                 $chat->where('chat_id', '=', $sessionid);
                 $chat->where('user_id', '=', $receive_id);
                 $chat->where('agent_typing', '=', false);
             })
             ->orWhere(function($chat) use ($sessionid,$receive_id){
                 $chat->where('chat_id', '=', $receive_id);
                 $chat->where('user_id', '=',$sessionid);
                 $chat->where('customer_typing', '=',false);
             })->get();
             //->orWhere(function($chat) use ($formatted_date){
              //   $chat->where('updated_at', '>=', $formatted_date);
            // })->get();

          //print_r($chatidfind);die;
    foreach($chatidfind as $chatidfinds)
      {  
           $agent_id=$chatidfinds->user_id;
      }
       if(count($chat) > 0)
          { 
            $istype='Y';
          }else{
            $istype='N';
          }
          $message =ChatMessage::where(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $receive_id);
                 $message->where('receive_id', '=', $sessionid);
                 $message->where('read','=',false);
                 $message->where('text_type', '=', 'A');
               })
             ->orWhere(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $sessionid);
                 $message->where('receive_id', $receive_id);
                 $message->where('read','=',false);
                 $message->where('text_type', '=', 'A');
               })->get();

             
          if(count($message) > 0)
          {
            $msg='Y';
          }else{
            $msg='N';
          }
          //$sessid=Auth::user()->session_id;
          //$see_id = (!empty($sessid)) ? ($sessid) : (''); 
          $agentonline = User::select('*')
          ->where('id','=',$agent_id)
          ->where('login_status','=','1')->get();
          //->orwhere('session_id',$agent_id)
          //->where('chat_status','=','1')->get();
         //echo count($agentonline);
        if(count($agentonline)==0){
          $online=count($agentonline);
          $agentimg='offline.jpg';
          $agentname='Pihu';
        }else{
        
        foreach ($agentonline as $agentonlines) 
        {
           $online=count($agentonline);
           $agentname=$agentonlines->name;
           $agentimg=$agentonlines->image;
         }
          
        }

          if(!empty($agent_id))
          { 
            return response()->json(['messages'=>$msg,'istype'=>$istype,'online'=>$online, 'agentname'=>$agentname,'agentimg'=>$agentimg, 'agent_id' => $agent_id]);
          }else{
            return response()->json(['messages'=>$msg,'istype'=>$istype, 'online'=>$online,'agentname'=>$agentname,'agentimg'=>$agentimg]);
          }
      }else{
        return response()->json(['messages'=>'Customer Session not start and fill a form then chat work','online'=>0,'agentname'=>'']);
      }


    
  }
  public function livechating_agent(Request $request)
  {
         //$data=$request->all();
         //print_r($data);die();
          $date =  date('Y-m-d H:i:s');
          $formatted_date=strtotime($date);    
          $formatted_date=date('Y-m-d H:i:s', $formatted_date-number_format(100));
          
          $sessionid = $request->sessionid;
          $receive_id = $request->receive_id;     
          //echo $sessionid .'|'.$receive_id;die();
          $chatidfind = Start_chat::select('*')->where('chat_id','=',$sessionid)->get();

          //$chatidfind = Chat::select('*')->get();

           $chat = Start_chat::where(function($chat) use ($sessionid,$receive_id){
                 $chat->where('chat_id', '=', $receive_id);
                 $chat->where('user_id', '=', $sessionid);
                 $chat->where('agent_typing', '=', false);
                 
             })
             ->orWhere(function($chat) use ($sessionid,$receive_id){
                 $chat->where('chat_id', '=', $sessionid);
                 $chat->where('user_id', '=',$receive_id);
                 $chat->where('customer_typing', '=', false);
              })->get();
             //echo $chat;die;
             /*->orWhere(function($chat) use ($formatted_date){
                 $chat->where('updated_at', '>=', $formatted_date);
             })*/
            /* echo '<pre>';
             print_r($chat);
             die();*/

    foreach($chat as $chats)
      {  
       //$customer_id=$chats->customer_id;
      $agent_id=$chats->user_id;
      }  
          
       if(count($chat) > 0)
          {
            $istype='Y';
            
          }else{
            $istype='N';
          }
        //echo $sessionid .'|'.$receive_id;die();
          $message =ChatMessage::where(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $sessionid);
                 $message->where('receive_id', '=', $receive_id);
                 $message->where('read','=',false);
                 $message->where('text_type', '=', 'C');
                })->orWhere(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $receive_id);
                 $message->where('receive_id', '=',$sessionid);
                 $message->where('read','=',false);
                 $message->where('text_type', '=', 'C');
                })->orWhere(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $receive_id);
                 $message->where('receive_id', '=',$sessionid);
                 $message->where('read','=',false);
                 $message->where('text_type', '=', 'A');
                 //$message->where('notification_admin', '=', true);
                 
                })
                //->orWhere(function($message) use ($sessionid,$receive_id){
                 //$message->where('sender_id', '=', $receive_id);
                 //$message->where('receive_id', '=',null);
                 //$message->where('read','=',false);
               //})
             ->get();
                   

      if(count($message) > 0)
          {
            $msg='Y';

          }else{
            $msg='N';
          }

      $user = Start_chat::select('*')->where('chat_status','=', '1')->orderBy('id', 'desc')->get();
      $total_customer=count($user);

      $messageunread=ChatMessage::select('*')->get();
      $output = '';
      
       if(count($messageunread) > 0){
        
          $output = count($messageunread);
        }
         
       if(!empty($agent_id))
        { 
        return response()->json(['messages'=>$msg,'istype'=>$istype,'agent_id'=>$agent_id,'total_customer'=>$total_customer,'output' => $output]);
        }else{
        return response()->json(['messages'=>$msg,'istype'=>$istype,'total_customer'=>$total_customer,'output' => $output]);
         }
  }

  public function livechating_admin(Request $request)
  {
         
          $date =  date('Y-m-d H:i:s');
          $formatted_date =strtotime($date);    
          $formatted_date=date('Y-m-d H:i:s', $formatted_date-number_format(100));
          $sessionid = $request->sessionid;
          $receive_id = $request->receive_id;     
          $chat = Chat::where(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id', '=', $receive_id);
                 $chat->where('agent_id', '=', $sessionid);
                 $chat->where('agent_typing', '=', true);
                 
             })
             ->orWhere(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id', '=', $sessionid);
                 $chat->where('agent_id', '=',$receive_id);
                 $chat->where('customer_typing', '=',true);
                  
             })->get();
             /*->orWhere(function($chat) use ($formatted_date){
                 $chat->where('updated_at', '>=', $formatted_date);
             })*/
       
       if(count($chat) > 0)
          {
            $istype='Y';
          }else{
            $istype='N';
          }
          $message =ChatMessage::where(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $sessionid);
                 $message->where('receive_id', '=', $receive_id);
                 $message->where('admn_seen','=',false);
                 
               })
             ->orWhere(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $receive_id);
                 $message->where('receive_id', '=',$sessionid);
                 $message->where('admn_seen','=',false);
                 
               })
             ->get();
         if(count($message) > 0)
          {
            $msg='Y';
          }else{
            $msg='N';
          }
  return response()->json(['messages'=>$msg,'istype'=>$istype]);
  } 
  public function retrieveChatMessages(Request $request)
    {

          $receive_id = $request->receive_id;
          $sessionid = $request->sessionid;
          //$admin_seen = $request->admin_seen;
          
          $userChat =  ChatMessage::where(function($userChat) use ($sessionid,$receive_id){
                 $userChat->where('sender_id', '=', $sessionid);
                 $userChat->where('receive_id', '=', $receive_id);
                 //$userChat->orwhere('receive_id', null);
            })
             ->orWhere(function($userChat) use ($sessionid,$receive_id){
                 $userChat->where('sender_id', '=', $receive_id);
                 $userChat->where('receive_id', '=',$sessionid);
                 //$userChat->orwhere('receive_id', null);
                 })->get();
            //print_r($userChat);die();

            $userdetail = Start_chat::where('chat_id','=', $receive_id)->get();

            //$userdetail1 = User::where('session_id','=', $sessionid)->get();
            if(count($userdetail) > 0)
              {
              foreach($userdetail as  $userdetails)
              {
              ChatMessage::where('sender_id', '=', $receive_id)
              ->update(['agent_img'=>$userdetails->image]);
              }
            }


          if(count($userChat) > 0)
           {
           foreach($userChat as  $userChats)
           {
           $message = ChatMessage::find($userChats->id);
            //if($admin_seen=='admin'){
              //$message->admn_seen = '1';

           //}else{
           $message->read = '1';
           //}
           $message->update();
           }
           }
        //$userimg = User::select('*')->where('type','=','agent')
        //->where('session_id','=','agent')
        //->where('Isactive','=','1')->get();   
   return response()->json($message);
}
  
  public function getUnreadMessageCount(Request $request)
  {
       
      $sessionid = $request->sessionid;
      $receive_id = $request->receive_id;
      $messageunread=ChatMessage::where('sender_id','=',$sessionid)->where('receive_id','=',$receive_id)
      ->where('status','=','1')->get();
      $numRows =count($messageunread); 
       $output = '';             
       if($numRows > 0){
          $output = $numRows;
        }
        return $output;
  }

  public function ajaxRequest()
    {
        return view('ajaxRequest');
    }
  public function ajaxRequestPost(Request $request)
    {
        
       
         $msg = $request->msg;
         $sessionid = $request->sessionid;
         $receive_id = $request->receive_id;
         $sender_name=$request->session_name; 
         $text_type = $request->text_type;

         //echo $sessionid.'|'.$receive_id.'|'.$sender_name.'|'.$text_type;die();
         if($text_type=='A'){
          $chatMessage = new ChatMessage();
          $chatMessage->sender_username = $sender_name;
          $chatMessage->message = $msg;
          $chatMessage->sender_id =$sessionid;
          $chatMessage->receive_id  =$receive_id;
          $chatMessage->text_type  =$text_type;
         
          $chatMessage->save();
         }else{
         if($text_type=='C'){
         $userdetail = Start_chat::select('*')
        ->where('chat_id','=',$sessionid)->get(); 
         }else{
         $userdetail = Start_chat::select('*')
        ->where('chat_id','=',$sessionid)->get();
         }
        // print_r($userdetail) ;die();
        foreach($userdetail as  $userdetails)
        {
         $sender_name=$userdetails->name;
         $dt=date('Y-m-d H:i:s');
         $colorcode=$userdetails->color;
         $updateuser=Start_chat::where('chat_id','=',$userdetails->chat_id)
                     ->update(['created_at'=>$dt,'last_msg'=>$msg]);

          $chatMessage = new ChatMessage();
          $chatMessage->sender_username = $sender_name;
          $chatMessage->message = $request->msg;
          $chatMessage->sender_id =$request->sessionid;
          $chatMessage->receive_id  =$userdetails->user_id;
          $chatMessage->text_type  =$request->text_type;
          $chatMessage->color  =$colorcode;
          $chatMessage->save();
         }
        }
  $response =  Response()->json([
                "success" => true,
                'session_id'=>$sessionid,
                'session_name'=>$sender_name,
                'receive_id'=>$receive_id
              ]);
   return $response;  
         //echo $Chatlist = Chat::where('customer_id','=', $sessionid)->where('agent_id', null)->get();
         //die;
         //echo count($Chatlist);die;
         //if(count($Chatlist) > 0){
         //$agent_id= Auth::user()->session_id;
         //$busylistcount = User::select('*')->where('type','=','agent')
           //              ->where('session_id','=', $agent_id)->first();
                
         //echo $list=$busylistcount->busy + 1;die;
         //$addbusylist = User::where('type','=','agent')
         //->where('session_id','=', $agent_id)
         //->update(['busy'=>$list]); 
         //}      
        //die;
 //$Chat = Chat::where('customer_id',$receive_id)->update(['agent_id'=>$sessionid, 'agent_typing'=>'1']);
 
 //$userChat = ChatMessage::where('sender_id',$receive_id)
 //->where('receive_id', null)
 //->update(['receive_id'=>$sessionid]);
    }

    public function documentupload(Request $request)
    {
      
     if ($files = $request->file('image')) 
         {
               $ext=$files->getClientOriginalExtension(); 
               $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
               $files->move(public_path('/doc'), $imageName);
               $save['sender_id'] = $request->sessionid;
               $save['receive_id'] = $request->receive_id;
               $save['sender_username'] = Auth::user()->name;
               $save['message'] = $request->chatSend;
               $save['file'] = $imageName;
               $save['ext'] = $ext;
               $save['read'] = '1';
               
               $save['agent_img'] = $request->agentimg;

               $save['created_at'] = date('Y-m-d H:i:s');
               $save['updated_at'] = date('Y-m-d H:i:s');
               
         }
         
         $check = ChatMessage::insertGetId($save);
         
         $response =  Response()->json([
                "success" => true,
                "image" => $check,
                "ext" => $ext,
                "file_path"=>$imageName
          ]);

 
        return $response;
    
      
    }

    public function customerdocument(Request $request)
    {

        //$data=$request->all();

        //print_r($data);die();

        if ($files = $request->file('image')) 
         {
          $sessionid=$request->sessionid;     
          $userdetail =  Start_chat::select('*')->where('chat_id','=',$sessionid)->get();
          //User::select('*')->where('session_id','=',$request->sessionid)->get(); 
                 
                foreach($userdetail as  $userdetails)
                {
                 $sender_name=$userdetails->name;
                 $dt=date('Y-m-d H:i:s');
                 $colorcode=$userdetails->color; 
              
                 $ext=$files->getClientOriginalExtension(); 
           
                 $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
                 $files->move(public_path('/doc'), $imageName);
                 $save['sender_id'] = $request->sessionid;
                 $save['receive_id'] = $request->receive_id;
                 $save['sender_username'] = $request->session_name;
                 $save['message'] = $request->chatSend;
                 $save['file'] = $imageName;
                 $save['ext'] = $ext;
                 $save['color'] = $colorcode;
                 $save['text_type'] = 'C';
                 $save['created_at'] = $dt;
                 $save['updated_at'] = $dt;


                 $check = ChatMessage::insertGetId($save);
              }
              $response =  Response()->json([
              "success" => true,
              "image" => $check,
              "ext" => $ext,
              "file_path"=>$imageName,
              "upload"=>"ok"
          ]);

          }
         return $response;  
    }
public function store(Request $request){
        
        $data=$request->all();
        $name=$data['name'];
        //$email=$data['email'];
        $ticket=$data['ticket'];
        $comment=$data['comment'];
       
        //print_r($data);die();
        $temp_agentid= mt_rand(100000, 999999); 
        //$name=$request->name;
        $firstchar=ucfirst($name[0]); 
        $cust_id= mt_rand(100000, 999999);
        
        $color=Color::select('*')->where('alfa_name','=',$firstchar)->get();
        foreach ($color as $key => $colors) 
        {
        $colorcode=$colors->alfa_color;  
        /*$User = new User;
        $User->name = $request->name;
        $User->mobileno = $request->mobileno;
        $User->email  = $request->email;
        $User->remember_token  = $request->_token;
        $User->password =Hash::make($cust_id);
        $User->type_request = $request->type;
        $User->query = $request->comment;
        $User->type = 'customer';
    
        $User->color = $colorcode;
        $User->session_id  =$cust_id;
        $User->temp_seesion  =$temp_agentid;
        $User->save();*/

        $User=User::where('id', Auth::user()->id)->update(['query'=>$comment, 'ticket_number'=>$ticket, 'color'=>$colorcode, 'session_id'=>$cust_id, 'temp_seesion'=>$temp_agentid]);
         
        $Chat = new Chat;
        $Chat->customer_id =$cust_id;
        $Chat->temp_seesion =$temp_agentid;
        $Chat->agent_id =$temp_agentid;
        $Chat->save();
        
      
        /*Session::put('session_id', $cust_id);
        Session::put('session_name', $name);
        Session::put('session_temp', $temp_agentid);*/


        $user = User::select('*')->where('type','=','agent')
        ->where('Isactive','=','1')->get();
        

        if(count($user)==0){
        $response =  Response()->json([
                "success" => true,
                'session_id'=>$cust_id,
                'session_name'=>$name,
                "customer_message" =>'<center><h5 class="text_ch1" style="position: absolute;"><p  style="margin: 0px;">Welcome to <span class="tsqua">Letchats</span></p><p style="margin: 0px;">Agent not Available.</p></h5></center>',
                'name'=>$name
          ]); 
       }else{
        $response =  Response()->json([
                "success" => true,
                'session_id'=>$cust_id,
                'session_name'=>$name,
                "customer_message" =>'<center><h5 class="text_ch1" style="position: absolute;"><p  style="margin: 0px;">Welcome to <span class="tsqua">Letchats</span></p><p style="margin: 0px;"></p></h5></center>',
                'name'=>$name
          ]);
       }
      }

    return $response;
    }




    /*public function store(Request $request){
        
         
        /*$clientIP = request()->ip();
        $data = \Location::get($clientIP);   
        
        $ip=$data->ip;
        $countryName=$data->countryName;
        $countryCode=$data->countryCode;
        $regionCode=$data->regionCode;
        $regionName=$data->regionName;
        $cityName=$data->cityName;
        $zipCode=$data->zipCode;
        $isoCode=$data->isoCode;
        $postalCode=$data->postalCode;
        $latitude=$data->latitude;
        $longitude=$data->longitude;
        $metroCode=$data->metroCode;
        $areaCode=$data->areaCode;
        $driver=$data->driver;*/ 
        /*$temp_agentid= mt_rand(100000, 999999); 
        $name=$request->name;
        $firstchar=ucfirst($name[0]); 
        $cust_id= mt_rand(100000, 999999);
        
        $color=Color::select('*')->where('alfa_name','=',$firstchar)->get();
        foreach ($color as $key => $colors) 
        {
        $colorcode=$colors->alfa_color;  
        $User = new User;
        $User->name = $request->name;
        $User->mobileno = $request->mobileno;
        $User->email  = $request->email;
        $User->remember_token  = $request->_token;
        $User->password =Hash::make($cust_id);
        $User->type_request = $request->type;
        $User->query = $request->comment;
        $User->type = 'customer';*/
        /*$User->ip_address = $ip;
        $User->countrycode = $countryCode;
        $User->regioncode = $regionCode;
        $User->regionname = $regionName;
        $User->zipcode = $zipCode;
        $User->isocode = $isoCode;
        $User->postalcode = $postalCode;
        $User->latitude = $latitude;
        $User->longitude = $longitude;
        $User->metrocode = $metroCode;
        $User->areacode = $areaCode;
        $User->driver = $driver;
        $User->city = $cityName;
        $User->country = $countryName;*/
        /*$User->color = $colorcode;
        $User->session_id  =$cust_id;
        $User->temp_seesion  =$temp_agentid;
        $User->save();
      
        $Chat = new Chat;
        $Chat->customer_id =$cust_id;
        $Chat->temp_seesion =$temp_agentid;
        $Chat->agent_id =$temp_agentid;
        $Chat->save();*/
        
        //$email = $request->email;
        //$password = Hash::make($cust_id);
          // if (Auth::attempt(['email' => $email, 'password' =>$password,'type' => 'customer'])) {
            //    $request->session()->put('data', $request->input());
              //  if($request->session()->has('data'))
                //  {
                  //$session_id= Auth::user()->session_id;        
                  //$Chat = User::where('session_id',$session_id)->update(['Isactive'=>'1']);        
                  //}
        //}
        /*Session::put('session_id', $cust_id);
        Session::put('session_name', $name);
        Session::put('session_temp', $temp_agentid);*/

        //$response= response()->json([
          //'success'=>'Start chat.',
          //'Seesion_id'=>$cust_id,
          //'name'=>$name
        //]);

        /*$user = User::select('*')->where('type','=','agent')
        ->where('Isactive','=','1')->get();*/
        

       /*  if(count($user)==0){
        $response =  Response()->json([
                "success" => true,
                'session_id'=>$cust_id,
                'session_name'=>$name,
                "customer_message" =>'<center><h5 class="text_ch1" style="position: absolute;"><p  style="margin: 0px;">Welcome to <span class="tsqua">Letchats</span></p><p style="margin: 0px;">Agent not Available.</p></h5></center>',
                'name'=>$name
          ]); 
       }else{
        $response =  Response()->json([
                "success" => true,
                'session_id'=>$cust_id,
                'session_name'=>$name,
                "customer_message" =>'<center><h5 class="text_ch1" style="position: absolute;"><p  style="margin: 0px;">Welcome to <span class="tsqua">Letchats</span></p><p style="margin: 0px;"></p></h5></center>',
                'name'=>$name
          ]);
       }
      }

    return $response;
    }*/
 public function downloadJSONFile(Request $request){
   $session_id=$request->session_id;
   $receive_id=$request->receive_id;

    $chathistory=ChatMessage::where(function($chathistory) use ($session_id,$receive_id){
                 $chathistory->where('sender_id', '=', $session_id);
                 $chathistory->where('receive_id', '=', $receive_id);
                 $chathistory->where('status', '=', '1');
              })
             ->orWhere(function($chathistory) use ($session_id,$receive_id){
                 $chathistory->where('sender_id', '=', $receive_id);
                 $chathistory->where('receive_id', '=',$session_id);
                 $chathistory->where('status', '=','1');
               })->get();
     
     $contents='';
     $contents.='Chat Name Message Date';
     foreach ($chathistory as $key => $chathistorys) 
          {
           $contents.='\r\n';
           $contents.=' '.$chathistorys->sender_username.' '.$chathistorys->message.' '.$chathistorys->created_at.'';
           $contents.='\r\n';
          }     
    $contents.='';
    
    $filename = date('Y-m-d').'_chathistory.txt';
    return response()->streamDownload(function () use ($contents) {
        echo $contents;
    }, $filename);
   
  }

  public function customer_session_logout(Request $request)
  {
   
     $session_id=$request->session_id;
     $session_name=$request->session_name;
     $receive_id=$request->receive_id;
     $msg='Customer logout';
     //echo $session_id.'|'.$session_name.'|'.$receive_id;die();

    $userdetail = Start_chat::select('*')->where('chat_id','=',$session_id)->get();
    //echo '<pre>';
    //print_r($userdetail);die();
        foreach($userdetail as  $userdetails)
        {
         $sender_name=$userdetails->name;
         $dt=date('Y-m-d H:i:s');
         $colorcode=$userdetails->color;
         $updateuser=Start_chat::where('chat_id','=',$userdetails->session_id)
                     ->update(['created_at'=>$dt,'last_msg'=>$msg]);

          $chatMessage = new ChatMessage();
          $chatMessage->sender_username = $sender_name;
          $chatMessage->message = $msg;
          $chatMessage->sender_id =$session_id;
          $chatMessage->receive_id  =$receive_id;
          $chatMessage->text_type  ='C';
          $chatMessage->color  =$colorcode;
          $chatMessage->save();
         }
    Start_chat::where('chat_id', '=', $session_id)
          ->update(['last_msg'=>$msg, 'chat_status'=>'0']);
    
    $session_id=Session::put('session_id');
    $session_name=Session::put('session_name');
    

    unset($session_id);
    unset($session_name);
    unset($receive_id);
    
    return redirect('/customer');
    
  }

   public function agent_update_id(Request $request)
    {
     $sessionid = $request->sessionid ;
     $receive_id =  $request->receive_id ;
      

      $chat = chat::where('customer_id', '=', $receive_id)
                         ->update(['agent_id'=>$sessionid,'check_tem'=>'A']); 
      $ChatMessage = ChatMessage::where('sender_id', '=', $receive_id)
                         ->update(['receive_id'=>$sessionid]); 
      $ChatMessage = ChatMessage::where('sender_id', '=', $receive_id)
                         ->update(['receive_id'=>$sessionid]);  
    }
  
 
    public function agentfetch_custo_record(Request $request)
    {
     //$sessionid=$request->sessionid;
     //$receive_id=$request->receive_id;
     $sessionid = (!empty($request->sessionid)) ? ($request->sessionid) : ('');
     $receive_id = (!empty($request->receive_id)) ? ($request->receive_id) : ('');
     //echo $sessionid .'|'.$receive_id;die();

     $message = ChatMessage::where(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $sessionid);
                 $message->where('receive_id', '=', $receive_id);
                 //$message->orwhere('receive_id', null); 

                 
             }) ->orWhere(function($message) use ($sessionid,$receive_id){
                 $message->where('sender_id', '=', $receive_id);
                 $message->where('receive_id', '=',$sessionid);
                 //$message->orwhere('receive_id', null);
              })->orderBy('id', 'asc')->get();

              //print_r(count($message));
           
           if(count($message) > 0)
            {
                 $message1 = ChatMessage::where(function($message1) use ($sessionid,$receive_id){
                 $message1->where('sender_id', '=', $sessionid);
                 $message1->where('receive_id', '=', $receive_id);
                 //$message1->orwhere('receive_id', null);
             })
             ->orWhere(function($message1) use ($sessionid,$receive_id){
                 $message1->where('sender_id', '=', $receive_id);
                 $message1->where('receive_id', '=',$sessionid);
                 //$message1->orwhere('receive_id', null);
                 
             })->update(['read'=>true]);
                  
           } 
      ChatMessage::where('sender_id', '=', $receive_id)
                         ->update(['status'=>'1']);

     
     return response()->json($message);
    }



    public function notTyping(Request $request){
          $sessionid = $request->sessionid;
          $receive_id = $request->receive_id;
       
        //$username = Input::get('username');
        $chat = Chat::where(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id', '=', $sessionid);
                 $chat->where('agent_id', '=', $receive_id);
                 
             })
             ->orWhere(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id', '=', $receive_id);
                 $chat->where('agent_id', '=',$sessionid);
                 
             })->first();
        //$chat = Chat::where('customer_id','=', $sessionid)
          //->where('agent_id','=', $receive_id)
          //->orwhere('customer_id','=', $receive_id)
          //->where('agent_id','=', $sessionid)
          //->first();
        
        if ($chat->customer_id == $sessionid)
            $chat->customer_typing = false;
        else
            $chat->agent_typing = false;
            $chat->update();
    }

public function isTyping(Request $request){
  
 $sessionid = $request->sessionid;
 $receive_id = $request->receive_id;

          //$sessionid = $request->sessionid; 
          //$receive_id = $request->receive_id;
         
            $chat = Chat::where(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id', $sessionid);
                 $chat->where('agent_id', $receive_id);
            })
             ->orWhere(function($chat) use ($sessionid,$receive_id){
                 $chat->where('customer_id',  $receive_id);
                 $chat->where('agent_id',  $sessionid);
                 })->first();
           
          //$chat = Chat::where('customer_id','=', $sessionid)
          //->where('agent_id','=', $receive_id)
          //->orwhere('customer_id','=', $receive_id)
          //->where('agent_id','=', $sessionid)
          //->first();
 
 
        if ($chat->customer_id == $sessionid)
            $chat->customer_typing = true;
        else
            $chat->agent_typing = true;
            $chat->update();
        return $chat;
    }

public function get_department()
{
   $Userrole=Userrole::select('*')->get();

   return view('admin.login');
}


}
