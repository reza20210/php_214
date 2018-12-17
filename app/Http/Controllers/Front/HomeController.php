<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index()
    {
        $products = Product::inRandomOrder()->take(4)->get();
        return view('front.index', compact('products'));
    }

    public function search(Request $request)
    {
        $searchKey = $request->search_key;
        $products = DB::table('products')
            ->where('name', 'like', "%{$searchKey}%")
            ->get();

        return view('front.index', compact('products'));
    }
}
