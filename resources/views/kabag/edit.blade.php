@extends('layouts.app')
@section('maincontent')
    <br>
    <div class="row">
        <div class="col-sm">
        <h1><small>Edit Kabag</small></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        
        </div>
        <div class="col-md-8">
        <form action="{{ url(kabag/update',$data->id ) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                            <div class="form-group">
                                <label for="nama_kabag">nama_kabag</label>
                                <input type="text" name="nama_kabag" class="form-control" id="nama_kabag" aria-describedby="nama_kabag" value="{{ $data->nama_kabag }}">
                            </div>
                            <input type="submit" value="submit" class="btn btn-primary">
                        </form>
        </div>
        <div class="col-md-2">
        
        </div>
    </div>
    

    

@endsection