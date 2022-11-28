<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
   protected $table = "process_customer";
   protected $fillable = ['id','customer_id','customer_name','mobile'];
}
