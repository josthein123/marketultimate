<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $primaryKey = 'id_prod';

    public function subcategoria()
    {
        // belongsTo : id_subcat -> Producto
        return $this->belongsTo('App\Subcategoria', 'id_subcat');
    }

    public function caracteristicas()
    {
        // hasMany : id_prod -> Producto_caracteristica
        return $this->hasMany('App\Producto_caracteristica', 'id_prod');
    }
}
