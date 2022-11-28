<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\CustomerMail;
use Illuminate\Http\Response;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class ReopenController extends Controller
{
    
  public  function send_email(){

      
           /*$details = array(
                 'ticno'=>'2022052311',
                 'customer_name' =>'siddharth',
                 
               );
        

 
                $test=Mail::to('siddharth@vert-age.com')->send(new CustomerMail($details));
                 
                 */

      
    }
}
