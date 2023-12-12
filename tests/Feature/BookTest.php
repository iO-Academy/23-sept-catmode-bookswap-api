<?php

namespace Tests\Feature;

use Illuminate\Testing\Fluent\AssertableJson;
use App\Models\Book;
use App\Models\Claim;
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
                                ->hasAll (['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews', 'claimed_by_name',])
                                    ->whereAllType([
                                        'id' => 'integer',
                                        'title' => 'string',
                                        'author' => 'string',
                                        'blurb' => 'string',
                                        'claimed_by_name' => 'string',
                                        'page_count' => 'integer',
                                        'year' => 'integer',
                                        'image' => 'string',
                                        'genre_id' => 'integer'
                                    ]);
                });
        });
}
    public function test_get_all_claimed_books(): void
    {
        $book = Book::factory()->create();
        $claim = Claim::factory()->create();
       
        $book->claimed_by_name = '';
        $claim->book_id = '';
      
        $book->save();
        $claim->save();

        $response = $this->getJson('/api/books?claimed=1');
        $response
                ->assertStatus(200)
                ->assertJson(function(AssertableJson $json) {
                    $json
                        ->hasAll(['message', 'data'])
                        ->has('data', 1, function(AssertableJson $json) {
                            $json
                                ->hasAll (['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews', 'claimed_by_name',]);
                                    
                });
        });

    }

    public function test_get_all_unclaimed_books(): void
    {
        $book = Book::factory()->create();
        $claim = Claim::factory()->create();
       
        $book->claimed_by_name = '';
      
        $book->save();
        $claim->save();

        $response = $this->getJson('/api/books?claimed=0');

        $response
                ->assertStatus(200)
                ->assertJson(function(AssertableJson $json) {
                    $json
                        ->hasAll(['message', 'data'])
                        ->has('data', 1, function(AssertableJson $json) {
                            $json
                                ->hasAll (['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews', 'claimed_by_name',]);
                                    
                });
        });

    }

    public function test_get_all_claimed_books_invalid(): void
    {
        $response = $this->getJson('/api/books?claimed=9');
        $response
                ->assertStatus(422)
                    ->assertJson([
                        'message' => "The claimed field must not be greater than 1."
                    ]);

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
                                    'data.claimed_by_name' => 'string',
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
