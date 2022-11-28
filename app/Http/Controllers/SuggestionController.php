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
use App\Models\Suggestion;
use App\Models\Suggestioncomment;
use Carbon\Carbon;
use App\Mail\Assign;
use App\Mail\CloseTicket;
use App\Mail\Tatdelivery;
use App\Mail\Activity;

class SuggestionController extends Controller
{
   
   public function showsuggestion()
   {
       if(Auth::user()->user_type=='Admin'){
             $Suggestion=Suggestion::all();
             return view('admin/suggestion')->with(['Suggestion'=>$Suggestion]);
       }else{
             $Suggestion=Suggestion::all();
             return view('admin/suggestion')->with(['Suggestion'=>$Suggestion]);     
       } 
   }
   
   public function suggestion_store(Request $request)
   {
       $data=$request->all();
         $Suggestion = new Suggestion;
            $Suggestion->name = $data['name'];
            $Suggestion->email = $data['email'];
            $Suggestion->title = $data['title'];
            $Suggestion->suggestion = $data['suggestion'];
            $Suggestion->uid = $data['id'];
            $Suggestion->save();    

        if($Suggestion){
           $arr = array("msg" => 'Your Suggestions Successfully Add!');
        }else{
           $arr = array("msg" => 'UnSuccessfull Add');
        }
       return response()->json($arr); 
   }

   public function user_comment(Request $request)
   {
      $id=$request->id;
      $Suggestion  = Suggestion::select('*')->where('id','=',$id)->get(); 
      return view('admin/comment')->with('Suggestion',$Suggestion); 
   }

   public function comment_msg(Request $request)
   {
      $data=$request->all();
            $id=$data['cid']; 
            $Suggestioncomment = new Suggestioncomment;
            $Suggestioncomment->cid = $data['cid'];
            $Suggestioncomment->uid = $data['uid'];
            $Suggestioncomment->comment = $data['comment'];
            $Suggestioncomment->save();
              if($Suggestioncomment){
                   if(Auth::user()->user_type=='Admin'){
                     $Suggestion  = Suggestion::select('*')->where('id','=',$data['cid'])->get();
                      return redirect('admin/comment-reply/'.$id)->with('Suggestion',$Suggestion);
                   }else{
                     $Suggestion  = Suggestion::select('*')->where('id','=',$data['cid'])->get();
                      return redirect('admin/comment-reply/'.$id)->with('Suggestion',$Suggestion);
                   }  
              }  
   }


}
