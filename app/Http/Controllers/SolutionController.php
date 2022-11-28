<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
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
use App\Models\Customer;
use App\Models\Knowledgebase;

class SolutionController extends Controller
{
    public function Solutionshow(Request $request)
    {
    	$category_name=$request->cate;
    	$subcategory=$request->sub;
    	
    	$Knowledge = Knowledgebase::select('*')->where('category_name','=', $category_name)
    	 ->where('sub_category','=', $subcategory)
    	 ->where('publish','=', '1')->orderBy('id', 'DESC')->get(); 
    	return view('/admin/Solutionshow')->with(['Knowledge'=>$Knowledge,'category_name'=>$category_name,'subcategory'=>$subcategory]);
       
    }

    public function Solutionsnew(Request $request)
    {
    	$category_name=$request->cate;
    	$subcategory=$request->sub;
      return view('/admin/Solutionsnew')->with(['category_name'=>$category_name,'subcategory'=>$subcategory]);
    }
    

    public function addsolution(Request $request)
    {
       
       $kb_titel=$request->kb_titel;
       $solution=$request->solution;
       $meta_titel=$request->meta_titel;
       $meta_keywords=$request->meta_keywords;
       $meta_description=$request->meta_description;
       $created_by=Auth::user()->name;
       $category_name=$request->category_name;
       $sub_category=$request->sub_category;

       $Knowledgebase = new Knowledgebase;
       $Knowledgebase->kb_titel = $kb_titel;
       $Knowledgebase->solution = $solution;
       $Knowledgebase->meta_titel = $meta_titel;
       $Knowledgebase->meta_keywords = $meta_keywords;
       $Knowledgebase->meta_description = $meta_description;
       $Knowledgebase->created_by = $created_by;
       $Knowledgebase->category_name = $category_name;
       $Knowledgebase->sub_category = $sub_category;
       $Knowledgebase->save();
       $publish=$Knowledgebase->publish;
       $arr = array('msg' => 'Successfully Inserted data', "response_code" => '201',"publish" => $publish); 
       return response()->json($arr, 201);
    }
    public function Publish_article(Request $request)
    {
          $title=$request->title;
          $category_name=$request->category_name;  
          $check = Knowledgebase::select('*')->where('kb_titel','=', $title)
          ->where('category_name','=', $category_name)->get(); 
          if(count($check) > 0)
          {
          
          $Knowledgebase = Knowledgebase::where('kb_titel',$title)
          ->where('category_name',$category_name)
          ->update(['publish'=>'1']);
          $arr = array(
              "msg" => 'Published',
              "response_code" => '201',
              "heading" => 'Published',
              );
          return response()->json($arr, 201);
          }else{

          $arr = array(
              "msg" => 'Not Found',
              "response_code" => '201',
              "heading" => 'Not Found',
              );
          return response()->json($arr, 201);
          }

    }

    public function Solutionsview($category_name,$id)
    {
    $articledetail = Knowledgebase::select('*')->where('category_name','=', $category_name)
      ->where('id','=', $id)->get();
    return view('/admin/Solutionsview')->with(['articledetail'=>$articledetail,'category_name'=>$category_name,'id'=>$id]);
    }

    public function Solutionsedit($category_name,$id){
      $articleview = Knowledgebase::select('*')->where('id','=', $id)->first();
      return view('/admin/Solutionsedit')->with('articleview',$articleview); 
    }
   public function editsolution(Request $request)
      {
       $hdn=$request->hdn;
       Knowledgebase::where('id','=',$hdn)->update(['kb_titel'=>$request->kb_titel,'solution'=>$request->solution,'meta_titel'=>$request->meta_titel,'meta_keywords'=>$request->meta_keywords,'meta_description'=>$request->meta_description ]);
       $arr = array('msg' => 'Update data', "response_code" => '201',"Success" => 'Update data'); 
       return response()->json($arr, 201);
      }   

}
