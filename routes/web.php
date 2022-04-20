<?php

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

//Route::get('/', function () {
////    app('log')->info('Welcome Bro');
//    return view('welcome');
//});

Route::view('/', 'welcome');

Route::get('/podcasts', 'PodcastController@index');
