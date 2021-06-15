<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\level;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use App\Models\kabag;

class userController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User::with('level','kabag')->paginate(10);
        $lvl = level::all();
        $kbg = kabag::all();
        return view('user.index',  compact('data','lvl','kbg'));
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
            'username'     => 'required',
            'password'      =>'required',
            'id_level'   => 'required',
            'id_kabag' => 'required'
        ]);
        // dd($request);
        $user = User::create([
            'username'     => $request->username,
            'name' => $request->username,
            'password'     => Hash::make($request->password),
            'id_level'   => $request->id_level,
            'id_kabag' => $request->id_kabag,
        ]);
        return redirect('user/index')
        ->with('success', 'User Successfully Added');
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
        $data = User::with('level')->where('id', $id)->first();
        $lvl = level::all();
        $kbg = kabag::all();
        return view('user.edit',  compact('data','lvl','kbg'));
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
            'username'     => 'required',
            'id_level'   => 'required'
        ]);
        $user = User::with('level')->where('id', $id)->first();
        $user->username = $request->get('username');
        $user->id_level = $request->get('id_level');
        $user->id_kabag = $request->get('id_kabag');
        $user->save();
        return redirect('user/index')
        ->with('success', 'User Successfully Edited');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        return redirect('user/index')
        -> with('success', 'User Successfully Deleted');
    }
}
