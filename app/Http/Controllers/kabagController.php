<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\kabag;

class kabagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = kabag::all();
        return view('kabag.index',  compact('data'));
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
            'nama_kabag'     => 'required',
        ]);
        // dd($request);
        $kabag = kabag::create([
            'nama_kabag'     => $request->nama_kabag,
        ]);
        return redirect('kabag/index')
        ->with('success', 'kabag Successfully Added');
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
        return view('kabag.edit',  compact('data'));
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
            'nama_kabag'     => 'required',
        ]);
        $kabag = kabag::where('id', $id)->first();
        $kabag->nama_kabag = $request->get('nama_kabag');
        $kabag->save();
        return redirect('kabag/index')
        ->with('success', 'kabag Successfully Edited');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        kabag::find($id)->delete();
        return redirect('kabag/index')
        -> with('success', 'kabag Successfully Deleted');
    }
}
