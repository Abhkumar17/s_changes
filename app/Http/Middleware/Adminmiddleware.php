<?php

namespace App\Http\Middleware;

use Closure;

class Adminmiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
       if(!session()->has('datas'))
          {
            return redirect('/admin');
          }
          return $next($request);

        
    }
}
