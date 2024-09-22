<?php

namespace App\Services\Api;

use App\Http\Requests\Api\RequestLogin;
use App\Http\Requests\Api\RequestUserRegister;
use App\Models\Product;
use App\Models\User;
use App\Repositories\ProductInterface;
use App\Repositories\ProductRepository;
use App\Repositories\UserInterface;
use App\Traits\APIResponsePlus;
use Illuminate\Support\Facades\Hash;
use Throwable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductService
{
    protected ProductInterface $productRepository;
    use APIResponsePlus; 

    public function __construct(
        ProductInterface $productRepository,
    ) {
        $this->productRepository = $productRepository;
    }

    public function get(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            
            $product = Product::find($id);

            DB::commit();

            return $this->responseSuccessWithData($product, 'Get product successfully !');
        } catch (Throwable $e) {
            DB::rollback();

            return $this->responseError($e->getMessage());
        }
    }

    public function all(Request $request)
    {
        DB::beginTransaction();
        try {
            
            $order_by = $request->order_by ?? 'id';
            switch ($order_by) {
                case 'name':
                    $order_by = 'name';
                    break;

                case 'description':
                    $order_by = 'description';
                    break;

                case 'price':
                    $order_by = 'price';
                    break;

                case 'id':
                    $order_by = 'id';
                    break;

                default:
                    $order_by = 'id';
                    break;
            }

            $order_direction = $request->order_direction ?? 'DESC';
            switch ($order_direction) {
                case 'DESC':
                    $order_direction = 'DESC';
                    break;

                default:
                    $order_direction = 'ASC';
                    break;
            }

            $filter = (object) [
                'search' => $request->search ?? '',
                'order_by' => $order_by,
                'order_direction' => $order_direction,
            ];

            $products = ProductRepository::getAll($filter);
            if (!(empty($request->per_page))) {
                $data = $products->paginate($request->per_page);
            } else {
                $data = $products->get();
            }

            DB::commit();

            return $this->responseSuccessWithData($data, 'Get products successfully !');
        } catch (Throwable $e) {
            DB::rollback();

            return $this->responseError($e->getMessage());
        }
    }

    public function add(Request $request)
    {
        DB::beginTransaction();
        try {
            
            $data = [
                'name' => $request->name,
                'description' => $request->description,
                'price' => $request->price,
            ];
            $new_product = Product::create($data);

            DB::commit();

            return $this->responseSuccessWithData($new_product, 'Add product successfully !');
        } catch (Throwable $e) {
            DB::rollback();

            return $this->responseError($e->getMessage());
        }
    }

    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            
            $product = Product::find($id);
            $data = [
                'name' => $request->name,
                'description' => $request->description,
                'price' => $request->price,
            ];
            $product->update($data);

            DB::commit();

            return $this->responseSuccessWithData($product, 'Update product successfully !');
        } catch (Throwable $e) {
            DB::rollback();

            return $this->responseError($e->getMessage());
        }
    }

    public function delete(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            
            $product = Product::find($id);
            $product->delete();

            DB::commit();

            return $this->responseSuccess('Delete product successfully !');
        } catch (Throwable $e) {
            DB::rollback();

            return $this->responseError($e->getMessage());
        }
    }
}
