<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Logfiles extends Model
{
    use HasFactory;

     protected $table = "process_log";

     protected $fillable = ['id','process_name','case_status','system_remark'];
}
