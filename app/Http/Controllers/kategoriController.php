<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\kategori;

class kategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = kategori::all();
        return view('kategori.index',  compact('data'));
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
        $this->validate($request, [
            'nama_kategori'     => 'required',
            'kode_surat' => 'required'
        ]);
        // dd($request);
        $kategori = kategori::create([
            'nama_kategori'     => $request->nama_kategori,
            'kode_surat'     => $request->kode_surat,
        ]);
        return redirect('kategori/index')
        ->with('success', 'kategori Successfully Added');
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
        $data = User::where('id', $id)->first();
        return view('kategori.edit',  compact('data'));
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
        $this->validate($request, [
            'nama_kategori'     => 'required',
            'kode_surat' => 'required'
        ]);
        $kategori = kategori::where('id', $id)->first();
        $kategori->nama_kategori = $request->get('nama_kategori');
        $kategori->kode_surat = $request->get('kode_surat');
        $kategori->save();
        return redirect('kategori/index')
        ->with('success', 'kategori Successfully Edited');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        kategori::find($id)->delete();
        return redirect('kategori/index')
        -> with('success', 'kategori Successfully Deleted');
    }
}
