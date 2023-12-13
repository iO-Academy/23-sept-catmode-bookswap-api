<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\ReviewController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(BookController::class)->group(function() {
    Route::get('/books', 'getAllBooks');
    Route::get('/books/{id}', 'getBookById');
    Route::put('/books/claim/{id}', 'claimBookById');
    Route::post('/books', 'addNewBook');
});

Route::controller(GenreController::class)->group(function() {
    Route::get('/genres', 'getAllGenres');
});

Route::controller(ReviewController::class)->group(function(){
    Route::post('/reviews', 'addBookReview');
});



