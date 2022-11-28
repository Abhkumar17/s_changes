<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
     protected $table = "document_ticket";

     protected $fillable = ['id','document_id','document_type','document_name'];
}
