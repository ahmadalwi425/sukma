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
                    <th>Status TU</th>
                    <th>Status Ketua</th>
                    <th>Preview</th>
                </tr>
                @foreach ($suratkeluar as $data)
                @if(Auth::user()->id_level==3)
                    @if($data->stat_tu == 'diterima')
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        
                        <td>{{$data->userkirim->name}}</td>
                        <td>{{$data->userterima->name}}</td>
                        <td>{{$data->kategori->nama_kategori}}</td>
                        <td>{{$data->judul}}</td>
                        <!--
                            chk artinya surat akan di cek
                            tr/tl artinya diterima atau ditolak
                            tu artinya Tata Usaha
                            kt artinya ketua
                            chktrtu artinya di cek untuk diterima oleh Tata Usaha
                        -->
                        @if(Auth::user()->id_level==1 || Auth::user()->id_level==2 || Auth::user()->id_level==3)
                            @if($data->stat_tu == 'menunggu')
                                <td><a class="btn btn-warning" href="{{ url('suratkeluar/chktrtu',$data->id) }}">Terima</a>
                                <a class="btn btn-warning" href="{{ url('suratkeluar/chktltu',$data->id) }}">Tolak</a></td>
                            @elseif($data->stat_tu == 'ditolak')
                                <td><a class="btn btn-danger" disable="true">Ditolak</a></td>
                            @elseif($data->stat_tu == 'diterima')
                                <td><a class="btn btn-primary" disable="true">Diterima</a></td>
                            @endif
                            
                            @if($data->stat_tu == 'ditolak')
                                <td><a class="btn btn-danger" disable="true">Ditolak TU</a></td>
                            @elseif($data->stat_prof == 'menunggu')
                                <td><a class="btn btn-warning" href="{{ url('suratkeluar/chktrkt',$data->id) }}">Terima</a>
                                <a class="btn btn-warning" href="{{ url('suratkeluar/chktlkt',$data->id) }}">Tolak</a></td>
                            @elseif($data->stat_prof == 'ditolak')
                                <td><a class="btn btn-danger" disable="true">Ditolak</a></td>
                            @elseif($data->stat_prof == 'diterima')
                                <td><a class="btn btn-primary" disable="true">Diterima</a></td>
                            @endif
                        @else
                            <td>{{$data->stat_tu}}</td>
                            <td>{{$data->stat_prof}}</td>
                        @endif
                            <td><a class="btn btn-primary" href="{{ url('surat/preview',$data->id) }}"><i class="nav-icon fas fa-eye"></i></a></td>
                    </tr>
                    @endif
                @else
                <tr>
                    <td>{{$loop->iteration}}</td>
                    
                    <td>{{$data->userkirim->name}}</td>
                    <td>{{$data->userterima->name}}</td>
                    <td>{{$data->kategori->nama_kategori}}</td>
                    <td>{{$data->judul}}</td>
                    <!--
                        chk artinya surat akan di cek
                        tr/tl artinya diterima atau ditolak
                        tu artinya Tata Usaha
                        kt artinya ketua
                        chktrtu artinya di cek untuk diterima oleh Tata Usaha
                    -->
                    @if(Auth::user()->id_level==1)
                        @if($data->stat_tu == 'menunggu')
                            <td><a class="btn btn-warning" href="{{ url('suratkeluar/chktrtu',$data->id) }}">Terima</a>
                            <a class="btn btn-warning" href="{{ url('suratkeluar/chktltu',$data->id) }}">Tolak</a></td>
                        @elseif($data->stat_tu == 'ditolak')
                            <td><a class="btn btn-danger" disable="true">Ditolak</a></td>
                        @elseif($data->stat_tu == 'diterima')
                            <td><a class="btn btn-primary" disable="true">Diterima</a></td>
                        @endif
                        
                        @if($data->stat_tu == 'ditolak')
                            <td><a class="btn btn-danger" disable="true">Ditolak TU</a></td>
                        @elseif($data->stat_prof == 'menunggu')
                            <td><a class="btn btn-warning" href="{{ url('suratkeluar/chktrkt',$data->id) }}">Terima</a>
                            <a class="btn btn-warning" href="{{ url('suratkeluar/chktlkt',$data->id) }}">Tolak</a></td>
                        @elseif($data->stat_prof == 'ditolak')
                            <td><a class="btn btn-danger" disable="true">Ditolak</a></td>
                        @elseif($data->stat_prof == 'diterima')
                            <td><a class="btn btn-primary" disable="true">Diterima</a></td>
                        @endif
                    @elseif(Auth()->id_level==2)
                        <td>{{$data->stat_tu}}</td>
                        <td>{{$data->stat_prof}}</td>
                    @elseif(Auth()->id_level==3)
                        <td>{{$data->stat_tu}}</td>
                        <td>{{$data->stat_prof}}</td>
                    @else
                        <td>{{$data->stat_tu}}</td>
                        <td>{{$data->stat_prof}}</td>
                    @endif
                        <td><a class="btn btn-primary" href="{{ url('surat/preview',$data->id) }}"><i class="nav-icon fas fa-eye"></i></a></td>
                </tr>
                @endif
                @endforeach
            </table>
            {{$suratkeluar->links('pagination::bootstrap-4')}}
        </div>
    </div>
</div>
@endsection