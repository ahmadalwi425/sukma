@extends('layouts.setter')
@section('navbar')
    @include('layouts.partials.header')
@endsection
<!-- @guest
    @if (Route::has('login'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
        </li>
    @endif
    @if (Route::has('register'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
        </li>
    @endif
    @else
@endguest -->
@section('sidebar')
    @include('layouts.partials.sidebar')
@endsection
@section('content')
    @yield('maincontent')
@endsection
@section('footer')
    @include('layouts.partials.footer')
@endsection