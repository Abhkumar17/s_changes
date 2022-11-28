<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class New_status extends Model
{
   protected $table = "status";
   protected $fillable = ['id','status'];
}
