<?php

namespace App\Repositories;

use App\Models\Product;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\DB;

class ProductRepository extends BaseRepository implements ProductInterface
{
    public function getModel()
    {
        return Product::class;
    }

    public static function getAll($filter)
    {
        $filter = (object) $filter;
        $data =  (new self)->model->where(function ($query) use ($filter) {
            $query->where('name', 'like', '%' . $filter->search . '%')
                ->orWhere('description', 'like', '%' . $filter->search . '%')
                ->orWhere('price', 'like', '%' . $filter->search . '%');
        })
        ->when(!empty($filter->order_by), function ($query) use ($filter) {
            $query->orderBy($filter->order_by, $filter->order_direction);
        });
        return $data;
    }

}
