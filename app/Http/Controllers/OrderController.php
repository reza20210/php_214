<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::all();
        return view('admin.orders.index', compact('orders'));
    }

    public function show($id)
    {
        $order = Order::find($id);
        return view('admin.orders.details', compact('order'));
    }

    public function confirm($id)
    {
        // Find tho order
        $order = Order::find($id);

        // Update the order
        $order->update([
            'status' => 1
        ]);

        // Session message
        session()->flash('msg', 'Order has been confirmed');

        // Redirect the page
        return redirect()->back();
    }

    public function pending($id)
    {
        // Find tho order
        $order = Order::find($id);

        // Update the order
        $order->update([
            'status' => 0
        ]);

        // Session message
        session()->flash('msg', 'Order has been again into pending');

        // Redirect the page
        return redirect()->back();
    }
}
