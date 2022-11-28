<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator,Redirect,Response;
use App\Models\{Country,State,City};
use Illuminate\Support\Facades\DB;


class CountryStateCityController extends Controller
{
    /*public function index()
    {
        $data['countries'] = Country::get(["name","id"]);
        return view('country-state-city',$data);
    }
    public function getState(Request $request)
    {

        //echo 'sunil';die();
        $data['states'] = State::where("country_id",$request->country_id)
                    ->get(["name","id"]);
        return response()->json($data);
    }
    public function getCity(Request $request)
    {
        $data['cities'] = City::where("state_id",$request->state_id)
                    ->get(["name","id"]);
        return response()->json($data);
    }*/

    public function showcountrystatecity()
    {
      $data = Country::select('*')->get();
    
      return view('/admin/country-state-city')->with('data',$data);  
    }
    public function getState(Request $request)
    {
       $datastate = State::select('*')->where("country_id",$request->country_id)
                    ->get();
        return response()->json($datastate);
    }
     public function getCity(Request $request)
    {
        $datacity = City::where("state_id",$request->state_id)
                    ->get();
        return response()->json($datacity);
    }

    public function addcountry(Request $request)
      {
        $country=$request->country;
        $phonecode=$request->phonecode;
        $countrycheck = Country::select('*')->where('name','=',$country)
        ->where('phonecode','=',$phonecode)->get();
        if(count($countrycheck) > 0){
           $arr = array(
                    "msg" => 'Already add',
                    "response_code" => '301',
                    );     

        }else{
                 
        $Country = new Country;
                $Country->name = $country;
                $Country->phonecode = $phonecode;
                $Country->save();
                $arr = array(
                "msg" => 'add successfully',
                "response_code" => '201',
                );         
        }
         return response()->json($arr);
      }


      public function addstate(Request $request)
      {
        $country=$request->country;
        $state=$request->state;
        $statecheck = State::select('*')->where('name','=',$state)->get();
        if(count($statecheck) > 0){
           $arr = array(
                    "msg" => 'Already add',
                    "response_code" => '301',
                    );     

        }else{
                 
                $State = new State;
                $State->name = $state;
                $State->country_id = $country;
                $State->save();

                $arr = array(
                "msg" => 'add successfully',
                "response_code" => '201',
                );         
        }
         return response()->json($arr);
      }

      public function addcity(Request $request)
       {
           $country=$request->countryid;
           $state=$request->stateid;
           $city=$request->cityid;
           $citycheck = City::select('*')->where('name','=',$city)->get();
           if(count($citycheck) > 0){
           $arr = array(
                    "msg" => 'Already add',
                    "response_code" => '301',
                    );     

        }else{
                 
                $City = new City;
                $City->name = $city;
                $City->state_id = $state;
                $City->save();

                $arr = array(
                "msg" => 'add successfully',
                "response_code" => '201',
                );         
        }
         return response()->json($arr);

       } 

       public function get_country(Request $request)
       {
              $id=$request->id;
              $Country = Country::find($id);
              $id=$Country->id;
              $name=$Country->name;
              $phonecode=$Country->phonecode;
              $arr = array(
                    'id' => $id,
                    'name' => $name,
                    'phonecode' => $phonecode
              );
              return response()->json($arr);
       }
       public function edit_country(Request $request)
       {
           $id=$request->edit_country_id;
           $oldcountry=$request->oldeditcountry;
           $country=$request->editcountry;
           $phonecode=$request->phonecode;

           //echo $id .'|'. $country .'|'.$phonecode .'|'.$oldcountry; die();

           $substatecheck = State::where('country_id', $oldcountry)->get();
           if(count($substatecheck) > 0){
             foreach ($substatecheck as $key => $value) {
             $updatestate = State::where('id','=',$value->id)->update(['country_id'=>$country]);
             }
           }
           $updatecountry = Country::where('id','=',$id)->update(['name'=>$country,'phonecode'=>$phonecode]);

            if($updatecountry){
               $arr = array("msg" => 'Successfull Update');
            }else{
               $arr = array("msg" => 'UnSuccessfull Update');
            }
            return response()->json($arr);
       }

       public function get_state(Request $request)
       {
              $id=$request->id;
              $State = State::find($id);
              $id=$State->id;
              $name=$State->name;
              $country=$State->country_id;
              
              $arr = array(
                    'id' => $id,
                    'name' => $name,
                    'country' => $country,
              );
              return response()->json($arr);
       }


       public function edit_state(Request $request)
       {
           $id=$request->edit_state_id;
           $country=$request->country;
           $oldstate=$request->oldstate;
           $state=$request->state;

           //echo $id .'|'.$country.'|'.$state.'|'.$oldstate; die();

           $citycheck = City::where('state_id', $oldstate)->get();
           if(count($citycheck) > 0){
            foreach ($citycheck as $key => $value) {
             $updatecity = City::where('id','=',$value->id)->update(['state_id'=>$state]);
             }
           }
           $updatestate = State::where('id','=',$id)->update(['name'=>$state]);

            if($updatestate){
               $arr = array("msg" => 'Successfull Update');
            }else{
               $arr = array("msg" => 'UnSuccessfull Update');
            }
            return response()->json($arr);
           
       }

      public function get_city(Request $request)
      {
              $id=$request->id;
              $City = City::find($id);
              $id=$City->id;
              $name=$City->name;
              $state=$City->state_id;

              
              $arr = array(
                    'id' => $id,
                    'name' => $name,
                    'state' => $state,
              );
              return response()->json($arr);
      }

      public function edit_city(Request $request)
      {
           $id=$request->edit_city_id;
           $state=$request->state;
           $city=$request->city;
           
           $updatecity = City::where('id','=',$id)->update(['name'=>$city]);

            if($updatecity){
               $arr = array("msg" => 'Successfull Update');
            }else{
               $arr = array("msg" => 'UnSuccessfull Update');
            }
            return response()->json($arr);
      }
       
      public function countrydel(Request $request)
       {
           echo $request->id;
       } 
}


