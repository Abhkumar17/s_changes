<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
   protected $table = "dispostion";
   protected $fillable = ['id','process_name','status','sub_status'];
}
