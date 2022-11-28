<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
	protected $table = "process_ticket";
    protected $fillable = ['id','ticket_number','mobile','email_id','owner'];
    
}
