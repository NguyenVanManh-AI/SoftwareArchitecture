<?php

use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\CommentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Admin
Route::prefix('admin')->controller(AdminController::class)->group(function () {
    Route::post('login', 'login');
    Route::post('forgot-pw-sendcode', 'forgotSend');
    Route::post('forgot-update', 'forgotUpdate');
    Route::middleware('check.auth:admin_api')->group(function () {
        Route::get('logout', 'logout');
        Route::get('profile', 'profile');
        Route::post('change-password', 'changePassword');
        Route::post('update', 'updateProfile');
    });
});

// User
Route::prefix('user')->controller(UserController::class)->group(function () {
    Route::post('register', 'register');
    Route::post('login', 'login');
    Route::post('forgot-pw-sendcode', 'forgotSend');
    Route::post('forgot-update', 'forgotUpdate');
    Route::middleware('check.auth:user_api')->group(function () {
        Route::get('logout', 'logout');
        Route::get('profile', 'profile');
        Route::post('change-password', 'changePassword');
        Route::post('update', 'updateProfile');
    });
});

Route::middleware('check.auth:admin_api,user_api')->group(function () {
    Route::get('/test', [AdminController::class, 'test']);
});

// Comments
Route::prefix('comment')->controller(CommentController::class)->group(function () {
    Route::middleware(['check.auth:user_api', 'role:hospital,doctor'])->group(function () {
        Route::post('test', 'testMiddleware');
        Route::post('add', 'addComment');
        Route::post('update', 'updateComment');
    });
    Route::get('article/{id}', 'commentOfArticle');
});

// Comments
Route::prefix('product')->controller(ProductController::class)->group(function () {
    Route::middleware(['check.auth:admin_api', 'role:manager,superadmin'])->group(function () {
        Route::get('get/{id}', 'get');
        Route::get('all', 'all');
        Route::post('add', 'add');
        Route::post('update/{id}', 'update');
        Route::get('delete/{id}', 'delete');
    });
});

// check.auth:user_api => ['check.auth:user_api', 'role:user']  (thêm ngoặc vuông nếu có nhiều middleware)