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
use App\Models\User;
use App\Models\Agent;
use App\Models\ChatMessage;
use App\Models\Chat;
use App\Models\Start_chat;
use App\Models\Color;
use App\Models\Ticket; 


class ChatController extends Controller
{
    
      public function startcustomerchat(Request $request)
       {

        $data=$request->all();
        $ticket_status=Ticket::select('*')->where('ticket_number','=',$data['ticketno'])->get();
        //echo $ticket_status;die(); 
        if(count($ticket_status) > 0)
        {
         
         foreach ($ticket_status as $key => $ticket_statuss) {
              $owner=$ticket_statuss->owner;
              //echo $email_id=$ticket_statuss->email_id;die();
              $user = User::select('*')->where('name','=',$owner)->first();
           
        $customerfirstchar=strtoupper(substr(Auth::user()->name, 0, 1));
        $colorcode=Color::select('*')->where('alfa_name','=',$customerfirstchar)->first();
        $colorcode=$colorcode['alfa_color'];  
        
        $Start_chat = new Start_chat;
        $Start_chat->chat_id =$data['session_id'];
        $Start_chat->name =$data['name'];
        
        $Start_chat->ticket_number =$data['ticketno'];
        $Start_chat->department =$data['department'];
        $Start_chat->messages =$data['message'];
        $Start_chat->chat_status =1;
        $Start_chat->save();
        
        $chatMessage = new ChatMessage();
        $chatMessage->sender_username = Auth::user()->name;
        $chatMessage->message = $data['message'];
        $chatMessage->sender_id =$data['session_id'];
        $chatMessage->receive_id  =$user['id'];
        $chatMessage->text_type  ='C';
        $chatMessage->color  =$colorcode;
        $chatMessage->status  =1;
        $chatMessage->save();
        }

         $response =  Response()->json([
                "success" => true,
                'session_id'=>$data['session_id'],
                'session_name'=>Auth::user()->name,
                'receive_id'=>$user['id']
          ]);

        }else{
         $response =  Response()->json([
                "success" => false,
                'receive_id'=>''
          ]); 

        }
        

          return $response;   
       } 


public function store(Request $request)
{
    $data=$request->all();

        $cust_id= mt_rand(100000, 999999);
        $ticket_status=Ticket::select('*')->where('ticket_number','=',$data['ticketno'])->get();
         
        if(count($ticket_status) > 0)
        {
         //print_r($ticket_status);die();
         foreach ($ticket_status as $key => $ticket_statuss) {
              $owner=$ticket_statuss->owner;
              $customer_name=$ticket_statuss->customer_name;
              $department=$ticket_statuss->department;
              $user = User::select('*')->where('name','=',$owner)->first();
           
        $customerfirstchar=strtoupper(substr($customer_name, 0, 1));
        $colorcode=Color::select('*')->where('alfa_name','=',$customerfirstchar)->first();
        $colorcode=$colorcode['alfa_color'];  
        
        $Start_chat = new Start_chat;
        $Start_chat->chat_id =$cust_id;
        $Start_chat->user_id =$user['id'];
        $Start_chat->name =$customer_name;
        $Start_chat->password =Hash::make($cust_id);
        $Start_chat->ticket_number =$data['ticketno'];
        $Start_chat->department =$department;
        $Start_chat->messages =$data['message'];
        $Start_chat->color =$colorcode;
        $Start_chat->chat_status =1;
        $Start_chat->save();
        
        $chatMessage = new ChatMessage();
        $chatMessage->sender_username = $customer_name;
        $chatMessage->message = $data['message'];
        $chatMessage->sender_id =$cust_id;
        $chatMessage->receive_id  =$user['id'];
        $chatMessage->text_type  ='C';
        $chatMessage->color  =$colorcode;
        $chatMessage->status  = '1';
        $chatMessage->save();
        }
       
        Session::put('session_id', $cust_id);
        Session::put('session_name', $customer_name);
        //Session::put('session_temp', $user['id']); 

         $response =  Response()->json([
                "success" => true,
                'session_id'=>$cust_id,
                'session_name'=>$customer_name,
                'receive_id'=>$user['id']
          ]);

        }else{
         $response =  Response()->json([
                "success" => false,
                'receive_id'=>''
          ]); 

        }
        

          return $response;
}




}
