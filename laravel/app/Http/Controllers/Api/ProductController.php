<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\Api\ProductService;

class ProductController extends Controller
{
    protected ProductService $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    public function get(Request $request, $id)
    {
        return $this->productService->get($request, $id);
    }

    public function all(Request $request)
    {
        return $this->productService->all($request);
    }

    public function add(Request $request)
    {
        return $this->productService->add($request);
    }

    public function update(Request $request, $id)
    {
        return $this->productService->update($request, $id);
    }

    public function delete(Request $request, $id)
    {
        return $this->productService->delete($request, $id);
    }
}
