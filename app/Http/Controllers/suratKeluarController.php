<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SuratKeluar;
use App\Models\SuratMasuk;
use App\Models\nomor;
use App\Models\Kategori;
use App\Models\User;
use Auth;
use PDF;

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
        $kategori = Kategori::all();
        $user = User::all();
        return view('surat.create', compact('kategori','user'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        SuratKeluar::create([
            'id_tujuan' => $request->id_tujuan,
            'id_pengirim' => $request->id_pengirim,
            'id_kategori' => $request->id_kategori,
            'content' => $request->ckeditor,
            'judul' => $request->judul,
        ]);
        return redirect()->route('suratkeluar.index');
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
        $kategori = Kategori::all();
        $user = User::all();
        $data = SuratKeluar::where('id',$id)->with('kategori','userterima','userkirim')->first();
        // $paginate = Student::orderBy('id_student', 'asc');
        return view('surat.edit', compact('data', 'user','kategori'));
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
        $data = SuratKeluar::where('id',$id)->with('kategori','userterima','userkirim')->first();
        $data->judul = $request->get('judul');
        $data->id_tujuan = $request->get('id_tujuan');
        $data->id_kategori = $request->get('id_kategori');
        $data->content = $request->get('ckeditor');
        $data->save();
        return redirect('surat/suratku');
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
        $nomor = nomor::create([
            'id_surat' => $id,
        ]);
        $suratmasuk = SuratMasuk::create([
            'id_penerima' => $data->id_tujuan,
            'id_pengirim' => $data->id_pengirim,
            'id_kategori' => $data->id_kategori,
            'perihal' => $data->judul,
            'id_surat' => $id,
        ]);
        return redirect()->route('suratkeluar.index');
    }
    public function tolak_ketua($id)
    {
        $data = SuratKeluar::find($id);
        $data->stat_prof = 'ditolak';
        $data->save();
        return redirect()->route('suratkeluar.index');
    }
    public function preview($id)
    {
        $suratkeluar = nomor::with('suratkeluar')->where('id_surat',$id)->first();
        // $paginate = Student::orderBy('id_student', 'asc');
        return view('surat.preview', ['suratkeluar' => $suratkeluar]);
    }

    public function print($id)
    {
        $suratkeluar = nomor::with('suratkeluar')->where('id_surat',$id)->first();
        $pdf = PDF::loadview('pdftmp.surat',['suratkeluar' => $suratkeluar]);
        return $pdf->stream();
        // $paginate = Student::orderBy('id_student', 'asc');
        // return view('surat.preview', ['suratkeluar' => $suratkeluar]);
    }

    public function suratku()
    {
        $userid = Auth::user()->id;
        $suratkeluar = SuratKeluar::with('kategori','userterima','userkirim')->where('id_pengirim',$userid)->paginate(5);
        return view('surat.suratku', ['suratkeluar' => $suratkeluar]);
    }
}
