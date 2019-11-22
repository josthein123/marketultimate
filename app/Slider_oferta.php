<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Slider_oferta extends Model
{
    protected $primaryKey = 'id_so';

    public function producto()
    {
        return $this->belongsTo('App\Producto', 'id_prod');
    }
}
