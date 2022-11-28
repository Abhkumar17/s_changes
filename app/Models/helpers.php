<?php
//use Auth;
//use Session;
use App\User;
use App\Sess;

function check_session()
{
date_default_timezone_set('Asia/Kolkata');
$dt=date("Y-m-d H:i:s");
return $dt;
}
function test(){
  //echo 'sunil';	
}
function session_validate()
{
	/* if(session()->has('datas') == 1)
	 { 
	   return redirect('/admin/dashboard');
	 }else{
	    return redirect('/admin');
	 }*/
}

