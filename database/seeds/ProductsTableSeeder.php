<?php

use App\Product;
use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Product::create([
            'name' => 'Xiaomi Mi4',
            'price' => '2000',
            'description' => 'This is some text for the Xiaomi Mi4',
            'image' => 'xiaomi-mi4.jpg',
        ]);

        Product::create([
            'name' => 'Xiaomi Mi5',
            'price' => '2500',
            'description' => 'This is some text for the Xiaomi Mi5',
            'image' => 'xiaomi-mi5.jpg',
        ]);

        Product::create([
            'name' => 'Xiaomi Mi6',
            'price' => '3000',
            'description' => 'This is some text for the Xiaomi Mi6',
            'image' => 'xiaomi-mi6.jpg',
        ]);

        Product::create([
            'name' => 'Xiaomi Mi8',
            'price' => '3500',
            'description' => 'This is some text for the Xiaomi Mi8',
            'image' => 'xiaomi-mi8.jpg',
        ]);
    }
}
