<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class subcategory extends Model
{
   protected $table = "process_subcategory";

   protected $fillable = ['id','process_name','cateid','sub_category'];
}
