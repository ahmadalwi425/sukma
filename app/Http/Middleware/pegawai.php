<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class pegawai
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
        if(Auth::user()->id_level != "4"){
            //ketika id_level bukan 4
            return redirect()->to('denied');
        }
        return $next($request);
    }
}
