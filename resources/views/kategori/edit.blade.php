@extends('layouts.app')
@section('maincontent')
    <br>
    <div class="row">
        <div class="col-sm">
        <h1><small>Edit Kategori</small></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        
        </div>
        <div class="col-md-8">
        <form action="{{ url('kategori/update',$data->id ) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                            <div class="form-group">
                                <label for="nama_kategori">nama_kategori</label>
                                <input type="text" name="nama_kategori" class="form-control" id="nama_kategori" aria-describedby="nama_kategori" value="{{ $data->nama_kategori }}">
                            </div>
                            <div class="form-group">
                                <label for="kode_surat">Kode Surat</label>
                                <input type="text" name="kode_surat" class="form-control" id="kode_surat" aria-describedby="nama_kategori" value="{{ $data->kode_surat }}">
                            </div>
                            <input type="submit" value="submit" class="btn btn-primary">
                        </form>
        </div>
        <div class="col-md-2">
        
        </div>
    </div>
    

    

@endsection