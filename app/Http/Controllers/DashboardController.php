<?php

namespace App\Http\Controllers;

use App\Order;
use App\Product;
use App\User;

class DashboardController extends Controller
{
    public function index()
    {
        $product = new Product();
        $order = new Order();
        $user = new User();

        return view('admin.dashboard', compact('product', 'order', 'user'));
    }
}
