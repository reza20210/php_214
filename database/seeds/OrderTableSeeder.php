<?php

use App\Order;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class OrderTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Order::create([
            'user_id' => 1,
            'date' => Carbon::today(),
            'address' => 'Tehran',
            'status' => 1
        ]);

        Order::create([
            'user_id' => 1,
            'date' => Carbon::today(),
            'address' => 'Tehran',
            'status' => 1
        ]);

        Order::create([
            'user_id' => 2,
            'date' => Carbon::today(),
            'address' => 'Tehran',
            'status' => 1
        ]);
    }
}
