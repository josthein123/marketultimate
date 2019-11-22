<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $primaryKey = 'id_cat';

    public function subcategorias()
    {
        return $this->hasMany('App\Subcategoria', 'id_cat');
    }
}
