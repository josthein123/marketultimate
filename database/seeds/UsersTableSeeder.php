<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'jostin',
            'email' => 'jostinvip97@gmail.com',
            'password' => bcrypt('123'),
            'id_tipo_usuario' => 1,
        ]);
    }
}
