<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SuratKeluar;

class SuratKeluarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suratkeluar = SuratKeluar::with('kategori','userterima','userkirim')->paginate(5);
        // $paginate = Student::orderBy('id_student', 'asc');
        return view('surat.index', ['suratkeluar' => $suratkeluar]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function terima_tu($id)
    {
        $data = SuratKeluar::find($id);
        $data->stat_tu = 'diterima';
        $data->save();
        return redirect()->route('suratkeluar.index');
    }
    public function tolak_tu($id)
    {
        $data = SuratKeluar::find($id);
        $data->stat_tu = 'ditolak';
        $data->save();
        return redirect()->route('suratkeluar.index');
    }
    public function terima_ketua($id)
    {
        $data = SuratKeluar::find($id);
        $data->stat_prof = 'diterima';
        $data->save();
        
        return redirect()->route('suratkeluar.index');
    }
    public function tolak_ketua($id)
    {
        $data = SuratKeluar::find($id);
        $data->stat_prof = 'ditolak';
        $data->save();
        return redirect()->route('suratkeluar.index');
    }
}
