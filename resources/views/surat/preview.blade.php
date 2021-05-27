@extends('layouts.app')

@section('content')
<a class="btn btn-primary" href="{{ url('print',$suratkeluar->id_surat) }}">Print</a>
<div class="container row justify-content-center">
    
    <div style="width:210mm;height:330mm;border:1px solid black;background-color:white;">
    <div style="padding:1.5cm;padding-top:0.5cm;padding-bottom:0px;">
    @include('layouts.partials.kop')
    </div>
    
    <div style="padding:2.54cm;padding-top:0px;">
    <p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Nomor&nbsp; &nbsp;:&nbsp;</span><span style="font-size:17px;">{{ $suratkeluar->id }}</span><span style="font-size:17px;">/U/MA.</span><span style="font-size:17px;">A</span><span style="font-size:17px;">/01/</span><span style="font-size:17px;">V</span><span style="font-size:17px;">/20</span><span style="font-size:17px;">21</span></p>
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Lamp.&nbsp; &nbsp;&nbsp;:&nbsp;</span><span style="font-size:17px;">-</span></p>
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Hal&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;: <strong>Undangan</strong></span></p>
<br><br>
    {!! $suratkeluar->suratkeluar->content !!}
    </div>
    
    </div>
</div>
@endsection