<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;

use App\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        return view('front.cart.index');
    }

    public function store(Request $request)
    {
        $duplicate = Cart::search(function ($cartItem, $rowID) use ($request) {
            return $cartItem->id === $request->id;
        });

        if ($duplicate->isNotEmpty()) {
            return redirect()->back()->with('msg', 'Item is already in your cart');
        }

        Cart::add($request->id, $request->name, 1, $request->price)->associate(Product::class);
        return redirect()->back()->with('msg', 'Item has been added to cart');
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'quantity' => 'required|numeric|between: 1,5'
        ]);

        if ($validator->fails()) {
            session()->flash('errors', 'Quantity must be between 1 and 5');
            return response()->json(['success' => false]);
        }

        Cart::update($id, $request->quantity);

        session()->flash('msg', 'Quantity has been updated');

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        Cart::remove($id);
        return redirect()->back()->with('msg', 'Item has been removed from cart');
    }

    public function saveLater($id)
    {
        $item = Cart::get($id);
        Cart::remove($id);

        $duplicate = Cart::instance('saveForLater')->search(function ($cartItem, $rowID) use ($id) {
            return $cartItem->id === $id;
        });

        if ($duplicate->isNotEmpty()) {
            return redirect()->back()->with('msg', 'Item is save for later');
        }

        Cart::instance('saveForLater')->add($item->id, $item->name, 1, $item->price)->associate(Product::class);
        return redirect()->back()->with('msg', 'Item has been save for later');
    }
}
