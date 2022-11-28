<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Categorysub extends Model
{
   protected $table = "process_category";

   protected $fillable = ['id','process_name','category_name'];
}
