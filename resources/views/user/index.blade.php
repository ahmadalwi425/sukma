@extends('layouts.app')
@section('maincontent')
    <br>
    <div class="row">
        <div class="col-sm">
        <h1><small>User table</small></h1>
        </div>
        <div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div>
        <div class="col-sm">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Add User
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">Add New User</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="{{ url('user/store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" class="form-control" id="username" aria-describedby="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" id="password" aria-describedby="Password" required>
                            </div>
                            <div class="form-group">
                                <label for="id_level">Role</label>
                                <select name="id_level" id="id_level" class="form-control">
                                    @foreach($lvl as $datalvl)
                                    <option value="{{$datalvl->id}}">{{$datalvl->nama_level}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="id_kabag">Kabag</label>
                                <select name="id_kabag" id="id_kabag" class="form-control">
                                <option value="">Non Kabag</option>
                                    @foreach($kbg as $datakbg)
                                    <option value="{{$datakbg->id}}">{{$datakbg->nama_kabag}}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    </div>
                    
                </div>
                </div>
            </div>
        </div>
    </div>

    <table class="table table-bordered table-hover" style="border-radius:3px;">
        <tr>
            <th>No</th>
            <th>Username</th>
            <th>Role</th>
            <th>Kabag</th>
            <th>Action</th>
        </tr>
        @foreach($data as $row)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $row->username }}</td>
            <td>{{ $row->level->nama_level }}</td>
            @if($row->kabag == null )
            <td>Pengurus (Non-kabag)</td>
            @else
            <td>{{ $row->kabag->nama_kabag }}</td>
            @endif
            <td><a class="btn btn-primary" href="{{ url('user/edit',$row->id) }}">Edit</a>
            @if($row->id == Auth::User()->id)
            <button class="btn btn-danger" href="{{ url('user/destroy',$row->id) }}" disabled>Delete</button></td>
            @else
            <a class="btn btn-danger" href="{{ url('user/destroy',$row->id) }}" onclick="return confirm('Are you sure wanna delete this user?');">Delete</a></td>
            @endif
        </tr>
        @endforeach
    </table>
    {{$data->links('pagination::bootstrap-4')}}

@endsection