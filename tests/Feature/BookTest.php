<?php

namespace Tests\Feature;

use Illuminate\Testing\Fluent\AssertableJson;
use App\Models\Book;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BookTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    use DatabaseMigrations;

    public function test_get_all_books(): void
    {
        Book::factory()->create();

        $response = $this->getJson('/api/books');

        $response
                ->assertStatus(200)
                ->assertJson(function(AssertableJson $json) {
                    $json
                        ->hasAll(['message', 'data'])
                        ->has('data', 1, function(AssertableJson $json) {
                            $json
                                ->hasAll (['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews'])
                                    ->whereAllType([
                                        'id' => 'integer',
                                        'title' => 'string',
                                        'author' => 'string',
                                        'blurb' => 'string',
                                        'page_count' => 'integer',
                                        'year' => 'integer',
                                        'image' => 'string',
                                        'genre_id' => 'integer'
                                    ]);
                });
        });
}

    public function test_get_book_by_id(): void
    {
        Book::factory()->create();

        $response = $this->getJson('/api/books/1');

        $response
                ->assertStatus(200)
                ->assertJson(function(AssertableJson $json)
                {
                    $json
                        ->hasAll(['message', 'data'])
                                ->whereAllType ([
                                    'data.id' => 'integer',
                                    'data.title' => 'string',
                                    'data.author' => 'string',
                                    'data.blurb' => 'string',
                                    'data.page_count' => 'integer',
                                    'data.year' => 'integer',
                                    'data.image' => 'string',
                                    'data.genre_id' => 'integer'
                                ]);
                });

    }

    public function test_get_book_by_id_invalid(): void
        {
            Book::factory()->create();

            $response = $this->getJson('/api/books/3');

            $response->assertStatus(404)
                    ->assertJson([
                        'message' => "Book with id 3 not found"
                    ]);
        }

}
