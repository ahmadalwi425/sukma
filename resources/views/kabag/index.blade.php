@extends('layouts.app')
@section('maincontent')
    <br>
    <div class="row">
        <div class="col-sm">
        <h1><small>kabag table</small></h1>
        </div>
        <div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div><div class="col-sm">
        </div>
        <div class="col-sm">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Add kabag
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">Add New kabag</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="{{ url('kabag/store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                            <div class="form-group">
                                <label for="nama_kabag">Nama kabag</label>
                                <input type="text" name="nama_kabag" class="form-control" id="nama_kabag" aria-describedby="nama_kabag" required>
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
            <th>Nama kabag</th>
            <th>Action</th>
        </tr>
        @foreach($data as $row)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $row->nama_kabag }}</td>
            <td><a class="btn btn-primary" href="{{ url('kabag/edit',$row->id) }}">Edit</a>
            <a class="btn btn-danger" href="{{ url('kabag/destroy',$row->id) }}" onclick="return confirm('Are you sure wanna delete this kabag?');">Delete</a></td>
        </tr>
        @endforeach
    </table>

@endsection