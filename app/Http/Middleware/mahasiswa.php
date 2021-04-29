<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class mahasiswa
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(Auth::user()->id_level != "5"){
            //ketika id_level bukan 5
            return redirect()->to('denied');
        }
        return $next($request);
    }
}
