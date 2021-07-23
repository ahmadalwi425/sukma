@extends('layouts.app')
@section('maincontent')
    <br>
    <div class="row">
        <div class="col-sm">
        <h1><small>Add User</small></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        
        </div>
        <div class="col-md-8">
        <form action="{{ url('user/update',$data->id ) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" class="form-control" id="username" aria-describedby="username" value="{{ $data->username }}">
                            </div>
                            <div class="form-group">
                                <label for="id_level">Role</label>
                                <select name="id_level" id="id_level" class="form-control">
                                    @foreach($lvl as $datalvl)
                                    @if($datalvl->id == $data->id_level)
                                    <option value="{{$datalvl->id}}" selected>{{$datalvl->nama_level}}</option>
                                    @else
                                    <option value="{{$datalvl->id}}">{{$datalvl->nama_level}}</option>
                                    @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="id_kabag">Kabag</label>
                                <select name="id_kabag" id="id_kabag" class="form-control">
                                    <option value="">Non Kabag</option>
                                    @foreach($kbg as $datakbg)
                                    @if($data->id_kabag == null)
                                    <option value="{{$datakbg->id}}">{{$datakbg->nama_kabag}}</option>
                                    @else
                                        @if($datakbg->id == $data->id_kabag)
                                        <option value="{{$datakbg->id}}" selected>{{$datakbg->nama_kabag}}</option>
                                        @else
                                        <option value="{{$datakbg->id}}">{{$datakbg->nama_kabag}}</option>
                                        @endif
                                    @endif
                                    @endforeach
                                </select>
                            </div>
                            <input type="submit" value="submit" class="btn btn-primary">
                        </form>
        </div>
        <div class="col-md-2">
        
        </div>
    </div>
    

    

@endsection