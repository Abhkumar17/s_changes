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
use Auth;
use Session;

class CampaignController extends Controller
{
    public function get_Campaignshow()
    {
        if (session()->has("datas")) {
            return view("admin/campaignshow");
        } else {
            return view("admin.userlogin");
        }
    }
}
