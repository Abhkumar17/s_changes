<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
   protected $table = "process_log";

   protected $fillable = ['id','process_name','case_status','system_remark'];
}
