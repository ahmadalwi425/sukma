@extends('layouts.app')

@section('content')
        @if($message == "sk")
        @elseif ($message == "nm")
        <a class="btn btn-primary" href="{{ url('print',$suratkeluar->id_surat) }}">Print</a>
        @endif

<div class="container row justify-content-center">
    
    <div style="width:210mm;height:330mm;border:1px solid black;background-color:white;">
    <div style="padding:1.5cm;padding-top:0.5cm;padding-bottom:0px;">
    @include('layouts.partials.kop')
    </div>
    
    <div style="padding:2.54cm;padding-top:0px;">
        @if($message == "sk")
        <p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Nomor&nbsp; &nbsp;:&nbsp;</span><span style="font-size:17px;">-</span><span style="font-size:17px;">/U/MA.</span><span style="font-size:17px;">A</span><span style="font-size:17px;">/01/</span><span style="font-size:17px;">{{ $month }}</span><span style="font-size:17px;">/{{ $years }}</span></p>
        @elseif ($message == "nm")
        <p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Nomor&nbsp; &nbsp;:&nbsp;</span><span style="font-size:17px;">{{ $suratkeluar->id }}</span><span style="font-size:17px;">/U/MA.</span><span style="font-size:17px;">A</span><span style="font-size:17px;">/01/</span><span style="font-size:17px;">{{ $month }}</span><span style="font-size:17px;">/{{ $years }}</span></p>
        @endif
    
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Lamp.&nbsp; &nbsp;&nbsp;:&nbsp;</span><span style="font-size:17px;">-</span></p>
@if($message == "sk")
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Hal&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;: <strong>{{ $suratkeluar->judul }}</strong></span></p>
<br><br>
@elseif ($message == "nm")
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Hal&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;: <strong>{{ $suratkeluar->suratkeluar->judul }}</strong></span></p>
<br><br>
@endif
        @if($message == "sk")
        {!! $suratkeluar->content !!}
        @elseif ($message == "nm")
        {!! $suratkeluar->suratkeluar->content !!}
        @endif
        
    
    </div>
    
    </div>
</div>
@endsection