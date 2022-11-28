<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Response;
use Auth;
use Session;
use App\User;


class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //Commands\DemoCron::class,
        Commands\ReplyCron::class,
        Commands\RegisterTicket::class,
        Commands\ReceiveIndex::class,
        Commands\ForwordMail::class,
        Commands\EmailAutomail::class,
        Commands\Refwd::class,
        
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
          $schedule->command('Reply:cron')->everyMinute();
   
          $schedule->command('Register:Ticket')->everyMinute();

          $schedule->command('Receive:Index')->everyMinute();

          $schedule->command('Forword:Mail')->everyMinute();

          $schedule->command('Email:Automail')->everyMinute();

          $schedule->command('Refwd:Auto')->everyMinute();

         // $schedule->command('demo:cron')->everyMinute();
           
    }

     /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
