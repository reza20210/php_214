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

/*
 * Admin Routes
 */
Route::prefix('admin')->group(function () {

    Route::middleware('auth:admin')->group(function () {
        // Dashboard
        Route::get('/', 'DashboardController@index');

        // Products
        Route::resource('/products', 'ProductController');

        // Orders
        Route::resource('/orders', 'OrderController');
        Route::get('/confirm/{id}', 'OrderController@confirm')->name('order.confirm');
        Route::get('/pending/{id}', 'OrderController@pending')->name('order.pending');

        // Users
        Route::resource('/users', 'UserController');

        // Log out
        Route::get('/logout', 'AdminUserController@logout');
    });

    // Admin Login
    Route::get('/login', 'AdminUserController@index')->name('login');
    Route::post('/login', 'AdminUserController@login');
});


/*
 * Front Routes
 */

Route::get('/', 'Front\HomeController@index');

/*
* User Routes
*/
Route::prefix('user')->group(function () {
    // User Registration
    Route::get('/register', 'Front\RegistrationController@index');
    Route::post('/register', 'Front\RegistrationController@store');

    // User login
    Route::get('/login', 'Front\SessionsController@index');
    Route::post('/login', 'Front\SessionsController@store');

    // User logout
    Route::get('/logout', 'Front\SessionsController@logout');

    Route::get('/profile', 'Front\UserProfileController@index');
    Route::get('/order/{id}', 'Front\UserProfileController@show');
});

/*
 *  Cart Routes
 */

Route::prefix('cart')->group(function () {
    // cart
    Route::get('/', 'Front\CartController@index');
    Route::post('/', 'Front\CartController@store')->name('cart');
    Route::delete('/remove/{product}', 'Front\CartController@destroy')->name('cart.destroy');
    Route::patch('/update/{product}', 'Front\CartController@update')->name('cart.update');
    Route::post('/saveLater/{product}', 'Front\CartController@saveLater')->name('cart.saveLater');

    // Sve for later
    Route::post('/cart/moveToCart/{product}', 'Front\SaveLaterController@moveToCart')->name('moveToCart');
});


// Sve for later
Route::delete('/saveLater/destroy/{product}', 'Front\SaveLaterController@destroy')->name('saveLater.destroy');

// Checkout
Route::get('/checkout', 'Front\CheckoutController@index');
Route::post('/checkout', 'Front\CheckoutController@store')->name('checkout');

Route::get('/empty', function () {
    Cart::instance('default')->destroy();
});

