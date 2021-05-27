@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <table class="table table-striped">
                <tr>
                    <th>No.</th>
                    <th>Pengirim</th>
                    <th>Penerima</th>
                    <th>Kategori</th>
                    <th>Judul</th>
                    <th>Preview</th>
                    
                </tr>
                @foreach ($suratkeluar as $data)
                <tr>
                    <td>{{$loop->iteration}}</td>
                    <td>{{$data->userkirim->name}}</td>
                    <td>{{$data->userterima->name}}</td>
                    <td>{{$data->kategori->nama_kategori}}</td>
                    <td>{{$data->judul}}</td>
                    <td><a class="btn btn-primary" href="{{ url('surat/preview',$data->id) }}"><i class="nav-icon fas fa-eye"></i></a></td>
                </tr>
                @endforeach
            </table>
        </div>
    </div>
</div>
@endsection