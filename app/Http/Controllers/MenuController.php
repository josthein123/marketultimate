<?php

namespace App\Http\Controllers;

use App\Menu;
use Illuminate\Http\Request;

class MenuController extends Controller
{

    public function index()
    {
        $mi_menu = Menu::where(['estado' => 1])->paginate(5);
        $data = compact('mi_menu');

        return view('admin.index', ['Menus' => $data]);
    }

    public function dsd()
    {

        return view('admin.index');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Menu $menu)
    {
        //
    }

    public function edit(Menu $menu)
    {
        //
    }

    public function update(Request $request, Menu $menu)
    {
        //
    }

    public function destroy(Menu $menu)
    {
        //
    }
}
