<?php

namespace App\Repositories;

/**
 * Interface ExampleRepository.
 */
interface ProductInterface extends RepositoryInterface
{
    public static function getAll($filter);

}
