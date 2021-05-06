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
        Route::get('/suratkeluar/chktrtu/{id}', [SuratKeluarController::class, 'terima_tu']);
        Route::get('/suratkeluar/chktltu/{id}', [SuratKeluarController::class, 'tolak_tu']);
        Route::get('/suratkeluar/chktrkt/{id}', [SuratKeluarController::class, 'terima_ketua']);
        Route::get('/suratkeluar/chktlkt/{id}', [SuratKeluarController::class, 'tolak_ketua']);
    });
    Route::get('/logout', function() {
        Auth::logout();
        redirect('/');
    });
    //route ketika page tidak sesuai hak akses, request dari middleware
    Route::get('/denied', [HomeController::class, 'denied']);
    Route::resource('suratkeluar', SuratKeluarController::class);
});
