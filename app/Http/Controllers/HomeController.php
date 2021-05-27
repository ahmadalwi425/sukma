<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use App\Models\SuratKeluar;
use App\Models\SuratMasuk;
use App\Models\nomor;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $userid = Auth::user()->id;
        $suratkeluar = SuratKeluar::with('kategori','userterima','userkirim')
            ->where(['id_tujuan'=>$userid,
                    'stat_tu'=>'diterima',
                    'stat_prof'=>'diterima'])->paginate(5);
        return view('home', ['suratkeluar' => $suratkeluar]);
    }
    public function tesadmin()
    {
        return view('admin.index');
    }
    public function denied()
    {
        return view('denied');
    }
}
