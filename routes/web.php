<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SuratKeluarController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::middleware(['auth'])->group(function () {
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::middleware(['admin'])->group(function () {
        Route::get('/tesadmin', [HomeController::class, 'tesadmin']);
        Route::get('/surat/create', [SuratKeluarController::class, 'create']);
        Route::get('/surat/suratku', [SuratKeluarController::class, 'suratku']);
        Route::get('/surat/masuk', [HomeController::class, 'index']);
        Route::get('/suratkeluar/chktrtu/{id}', [SuratKeluarController::class, 'terima_tu']);
        Route::get('/suratkeluar/chktltu/{id}', [SuratKeluarController::class, 'tolak_tu']);
        Route::get('/suratkeluar/chktrkt/{id}', [SuratKeluarController::class, 'terima_ketua']);
        Route::get('/suratkeluar/chktlkt/{id}', [SuratKeluarController::class, 'tolak_ketua']);
        Route::post('/surat/store', [SuratKeluarController::class,'store']); 
        Route::get('/surat/edit/{id}', [SuratKeluarController::class,'edit']); 
        Route::get('/surat/destroy/{id}', [SuratKeluarController::class,'destroy']); 
        Route::get('/surat/preview/{id}', [SuratKeluarController::class,'preview']); 
        Route::get('/print/{id}', [SuratKeluarController::class,'print']);
        Route::put('/surat/update/{id}', [SuratKeluarController::class,'update']); 
    });
    Route::middleware(['ketua'])->group(function () {
        Route::get('/surat/create', [SuratKeluarController::class, 'create']);
        Route::get('/surat/suratku', [SuratKeluarController::class, 'suratku']);
        Route::get('/surat/masuk', [HomeController::class, 'index']);
        Route::get('/suratkeluar/chktrkt/{id}', [SuratKeluarController::class, 'terima_ketua']);
        Route::get('/suratkeluar/chktlkt/{id}', [SuratKeluarController::class, 'tolak_ketua']);
        Route::post('/surat/store', [SuratKeluarController::class,'store']); 
        Route::get('/surat/edit/{id}', [SuratKeluarController::class,'edit']); 
        Route::get('/surat/destroy/{id}', [SuratKeluarController::class,'destroy']); 
        Route::get('/surat/preview/{id}', [SuratKeluarController::class,'preview']); 
        Route::get('/print/{id}', [SuratKeluarController::class,'print']);
        Route::put('/surat/update/{id}', [SuratKeluarController::class,'update']); 
    });
    Route::middleware(['operator'])->group(function () {

    });
    Route::middleware(['karyawan'])->group(function () {

    });
    Route::middleware(['mahasiswa'])->group(function () {

    });
    Route::get('/logout', function() {
        Auth::logout();
        redirect('/');
    });
    //route ketika page tidak sesuai hak akses, request dari middleware
    Route::get('/denied', [HomeController::class, 'denied']);
    Route::resource('suratkeluar', SuratKeluarController::class);
    Route::get('/surat/masuk', [HomeController::class, 'index']);
});

