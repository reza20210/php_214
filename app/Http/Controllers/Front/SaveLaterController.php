<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Product;
use Gloudemans\Shoppingcart\Facades\Cart;

class SaveLaterController extends Controller
{
    public function destroy($id)
    {
        Cart::instance('saveForLater')->remove($id);
        return redirect()->back()->with('msg', 'Item has been removed save from later');
    }

    public function moveToCart($id)
    {
        $item = Cart::instance('saveForLater')->get($id);
        Cart::instance('saveForLater')->remove($id);

        $duplicate = Cart::instance('saveForLater')->search(function ($cartItem, $rowID) use ($id) {
            return $cartItem->id === $id;
        });

        if ($duplicate->isNotEmpty()) {
            return redirect()->back()->with('msg', 'Item is save for later');
        }

        Cart::instance('default')->add($item->id, $item->name, 1, $item->price)->associate(Product::class);
        return redirect()->back()->with('msg', 'Item has been moved to cart');
    }
}