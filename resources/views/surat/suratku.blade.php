@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-striped">
                <tr>
                    <th>No.</th>
                    <th>Pengirim</th>
                    <th>Penerima</th>
                    <th>Kategori</th>
                    <th>Judul</th>
                    <th>TU</th>
                    <th>Ketua</th>
                    <th>Aksi</th>
                    <th>Preview</th>
                    
                </tr>
                @foreach ($suratkeluar as $data)
                <tr>
                    <td>{{$loop->iteration}}</td>
                    <td>{{$data->userkirim->name}}</td>
                    <td>{{$data->userterima->name}}</td>
                    <td>{{$data->kategori->nama_kategori}}</td>
                    <td>{{$data->judul}}</td>
                    <td>{{$data->stat_tu}}</td>
                    <td>{{$data->stat_prof}}</td>
                    @if($data->stat_prof == "diterima")
                    <td><a class="btn btn-info" disabled>Surat Telah Diterima</a></td>
                    @else
                    <td><a class="btn btn-primary" href="{{ url('surat/edit',$data->id) }}">Edit</a>
                    <button class="btn btn-danger" href="{{ url('surat/destroy',$data->id) }}">Delete</button></td>
                    @endif
                    <td><a class="btn btn-primary" href="{{ url('surat/preview',$data->id) }}"><i class="nav-icon fas fa-eye"></i></a></td>
                </tr>
                @endforeach
            </table>
            {{$suratkeluar->links('pagination::bootstrap-4')}}
        </div>
    </div>
</div>
@endsection