<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = "process_product";

   protected $fillable = ['id','product','product_code','product_category'];
}
