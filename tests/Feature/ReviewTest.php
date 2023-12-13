<?php

namespace Tests\Feature;

use App\Models\Book;
use App\Models\Review;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ReviewTest extends TestCase
{

    use DatabaseMigrations;

    public function test_add_book_review(): void
    {
        Book::factory()->create();
        Review::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '4', 'review' => 'What an amazing book!', 'book_id' => '1']);

        $response->assertStatus(201)
            ->assertJson([
                'message' => 'Review created'
            ]);
    }

    public function test_add_book_review_name_invalid(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => '', 'rating' => '4', 'review' => 'What an amazing book!', 'book_id' => '1']);

        $response->assertInvalid([
                'name'
            ]);
    }

    public function test_add_book_review_rating_invalid(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '', 'review' => 'What an amazing book!', 'book_id' => '1']);

        $response->assertInvalid([
            'rating'
        ]);
    }

    public function test_add_book_review_review_invalid(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '4', 'review' => '', 'book_id' => '1']);

        $response->assertInvalid([
            'review'
        ]);
    }

    public function test_add_book_review_book_id_invalid(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '4', 'review' => 'Nice book.', 'book_id' => '']);

        $response->assertInvalid([
            'book_id'
        ]);
    }

    public function test_add_book_review_rating_outside_min(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '-1', 'review' => 'What an amazing book!', 'book_id' => '1']);

        $response->assertStatus(422)
            ->assertJson([
                'message' => 'The rating field is required.',
                'message' => 'The rating field must be at least 0.',
            ]);
    }

    public function test_add_book_review_rating_outside_max(): void
    {
        Book::factory()->create();

        $response = $this->postJson('/api/reviews', ['name' => 'Book', 'rating' => '6', 'review' => 'What an amazing book!', 'book_id' => '1']);

        $response->assertStatus(422)
            ->assertJson([
                'message' => 'The rating field is required.',
                'message' => 'The rating field must not be greater than 5.',
            ]);
    }
}
