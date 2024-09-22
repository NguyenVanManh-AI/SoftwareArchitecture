<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word(), // Tạo tên sản phẩm ngẫu nhiên
            'description' => $this->faker->sentence(), // Tạo mô tả ngẫu nhiên
            'price' => $this->faker->randomFloat(2, 10, 1000), // Tạo giá ngẫu nhiên từ 10 đến 1000
        ];
    }
}
