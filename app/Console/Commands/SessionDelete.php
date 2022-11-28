<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Auth;
use Session;
use App\User;
use App\Sess;

class SessionDelete extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'minute:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This will be clean Session';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
       // return 'string';die();
       /*info('Register the commands for the application');
        return 0;*/
        
        echo Auth::user()->id;

          
        DB::table('sessions')->delete();
        echo "Operation Done";
        Auth::logout();
        Session::flush();
        /*$user = Sess::select('*')->get();
        foreach ($user as $key => $value) {
           echo $value->updated_at;
         
        }*/
       
       
    }
}
