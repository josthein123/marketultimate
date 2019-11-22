<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subcategoria extends Model
{
    protected $primaryKey = 'id_subcat';

    public function categoria()
    {
        return $this->belongsTo('App\Categoria', 'id_cat');
    }
}
