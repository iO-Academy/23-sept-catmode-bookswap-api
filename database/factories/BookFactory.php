<?php

namespace Database\Factories;

use App\Models\Genre;
use App\Models\Claim;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Book>
 */
class BookFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->text(255), 
            'author' => $this->faker->text(150), 
            'blurb' => $this->faker->text(255), 
            'genre_id' => Genre::factory(),
            'claimed_by_name' => $this->faker->text(255), 
            'page_count' => rand(50, 1000),
            'year' => $this->faker->year,
            'image' => $this->faker->imageUrl(),
        ];               
     }
}
