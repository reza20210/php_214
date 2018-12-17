<?php

namespace App\Http\Controllers;

use App\Order;
use App\User;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return view('admin.users.index', compact('users'));
    }

    public function show($id)
    {
        $orders = Order::where('user_id', $id)->get();
        if (empty($orders[0])) {
            // Session message
            session()->flash('msg', 'The user has not ordered anything yet.');
            // Redirect the page
            return redirect()->back();
        } else {
            return view('admin.users.details', compact('orders'));
        }
    }

}
