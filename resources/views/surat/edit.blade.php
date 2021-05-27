@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
        <div class="card" style="">
    <div class="card-header">
    Edit Surat
    </div>
    <div class="card-body">
    @if ($errors->any())
    <div class="alert alert-danger">
    <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
    @foreach ($errors->all() as $error)
    <li>{{ $error }}</li>
    @endforeach
    </ul>
    </div>
    @endif
    <form method="post" action="{{ url('surat/update/'.$data->id) }}" id="myForm" enctype="multipart/form-data">
    @csrf
    @method('PUT')
    <div class="form-group">
    <label for="judul">judul</label>
    <input type="text" name="judul" class="form-control" id="judul" aria-describedby="judul" value="{{ $data->judul }}">
    </div>
    <input type="hidden" name="id_pengirim" value="{{ Auth::user()->id }}">
    <div class="form-group">
    <label for="id_tujuan">Tujuan</label>
    <select name="id_tujuan" id="" class="form-control">
    @foreach($user as $us)
    @if($us->id==$data->id_tujuan)
        <option value="{{$us->id}}" selected>{{$us->name}}</option>
    @else
        <option value="{{$us->id}}">{{$us->name}}</option>
    @endif
    @endforeach
    </select>
    </div>
    <div class="form-group">
    <label for="id_kategori">Kategori</label>
    <select name="id_kategori" id="" class="form-control">
    @foreach($kategori as $kat)
    @if($kat->id==$data->id_kategori)
        <option value="{{$kat->id}}" selected>{{$kat->nama_kategori}}</option>
    @else
        <option value="{{$kat->id}}">{{$kat->nama_kategori}}</option>
    @endif
    @endforeach
    </select>
    </div>
    <div class="form-group">
    <label for="ckeditor">Isi</label>
    <textarea name="ckeditor" class="ckeditor" id="ckeditor">{!!$data->content!!}</textarea>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
    </div>
        </div>
    </div>
</div>
<script type="text/javascript">
        CKEDITOR.replace('ckeditor',{tabSpaces:4});
    </script>
@endsection
