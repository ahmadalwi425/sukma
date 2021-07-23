<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SuratKeluarController;
use App\Http\Controllers\userController;
use App\Http\Controllers\kategoriController;
use App\Http\Controllers\kabagController;

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

    Route::get('/user/index', [userController::class,'index']); 
    Route::get('/user/create', [userController::class,'create']); 
    Route::post('/user/store', [userController::class,'store']); 
    Route::get('/user/edit/{id}', [userController::class,'edit']); 
    Route::get('/user/destroy/{id}', [userController::class,'destroy']); 
    Route::put('/user/update/{id}', [userController::class,'update']); 
    
    Route::get('/kategori/index', [kategoriController::class,'index']); 
    Route::get('/kategori/create', [kategoriController::class,'create']); 
    Route::post('/kategori/store', [kategoriController::class,'store']); 
    Route::get('/kategori/edit/{id}', [kategoriController::class,'edit']); 
    Route::get('/kategori/destroy/{id}', [kategoriController::class,'destroy']); 
    Route::put('/kategori/update/{id}', [kategoriController::class,'update']); 

    Route::get('/kabag/index', [kabagController::class,'index']); 
    Route::get('/kabag/create', [kabagController::class,'create']); 
    Route::post('/kabag/store', [kabagController::class,'store']); 
    Route::get('/kabag/edit/{id}', [kabagController::class,'edit']); 
    Route::get('/kabag/destroy/{id}', [kabagController::class,'destroy']); 
    Route::put('/kabag/update/{id}', [kabagController::class,'update']); 
    Route::get('/logout', function() {
        Auth::logout();
        redirect('/');
    });
    //route ketika page tidak sesuai hak akses, request dari middleware
    Route::get('/denied', [HomeController::class, 'denied']);
    Route::resource('suratkeluar', SuratKeluarController::class);
});

