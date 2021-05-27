<style>
html { margin: 1.25cm; margin-top: 0cm;}
</style>
    <div style="padding:0cm;padding-top:0.5cm;padding-bottom:0px;margin-bottom:0px;">
    @include('layouts.partials.kop2')
    </div>
    
    <div style="padding:1.39cm;padding-top:0px;">
    <p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Nomor&nbsp; &nbsp;:&nbsp;</span><span style="font-size:17px;">{{ $suratkeluar->id }}</span><span style="font-size:17px;">/U/MA.</span><span style="font-size:17px;">A</span><span style="font-size:17px;">/01/</span><span style="font-size:17px;">V</span><span style="font-size:17px;">/20</span><span style="font-size:17px;">21</span></p>
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Lamp.&nbsp; &nbsp;&nbsp;:&nbsp;</span><span style="font-size:17px;">-</span></p>
<p style='margin:0cm;font-size:16px;font-family:"Times New Roman",serif;text-align:justify;'><span style="font-size:17px;">Hal&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;: <strong>Undangan</strong></span></p>
<br><br>
    {!! $suratkeluar->suratkeluar->content !!}
    </div>
