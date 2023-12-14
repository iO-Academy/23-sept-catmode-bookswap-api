<?php

namespace Tests\Feature;

use Illuminate\Testing\Fluent\AssertableJson;
use App\Models\Book;
use App\Models\Claim;
use App\Models\Genre; 
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

    public function test_get_books_filtered_by_genre(): void
    {
        
            $genre1 = Genre::factory()->create();
            
            Book::factory()->count(3)->create(['genre_id' => $genre1->id]);

            $genre2 = Genre::factory()->create();
            
            Book::factory()->count(3)->create(['genre_id' => $genre2->id]);

            $response = $this->getJson('/api/books?genre=1');

            $response
                ->assertStatus(200)
                ->assertJson(function (AssertableJson $json) {
                    $json
                        ->hasAll(['message', 'data'])
                        ->has('data', 3, function (AssertableJson $json) {
                            $json
                                ->hasAll (['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews'])
                                ->whereAllType ([
                                    'id' => 'integer',
                                    'title' => 'string',
                                    'author' => 'string',
                                    'blurb' => 'string',
                                    'claimed_by_name' =>'string',
                                    'page_count' => 'integer',
                                    'year' => 'integer',
                                    'image' => 'string',
                                    'genre_id' => 'integer',
                                ]);
                        });
                });
        }
        
        public function test_search_books(): void
        {
            $book = Book::factory()->create([
                'title' => 'Harry Potter',
                'author' => 'Harry Maguire',
                'blurb' => 'Harry book',
            ]);

            $book2 = Book::factory()->create([
                'title' => 'Lord of the Rings',
                'author' => 'J.R.R. Tolkien',
                'blurb' => 'Fantasy masterpiece',
            ]);

            $response = $this->getJson('/api/books?search=Harry');

            $response
                ->assertStatus(200)
                ->assertJson(function (AssertableJson $json) {
                    $json
                        ->hasAll(['message', 'data'])
                        ->has('data', 1, function (AssertableJson $json) {
                            $json
                                ->hasAll(['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id', 'genre', 'reviews'])
                                ->whereAllType([
                                    'id' => 'integer',
                                    'title' => 'string',
                                    'author' => 'string',
                                    'blurb' => 'string',
                                    'claimed_by_name' =>'string',
                                    'page_count' => 'integer',
                                    'year' => 'integer',
                                    'image' => 'string',
                                    'genre_id' => 'integer',
                                ]);
                        });
                });
                
                $responseAll = $this->getJson('/api/books?search=Harry&claimed=1&genre=1');
                $responseAll
                    ->assertStatus(200)
                    ->assertJson(function (AssertableJson $json) {
                        $json
                            ->hasAll(['message', 'data'])
                            ->has('data',1, function (AssertableJson $json) {
                                $json
                                    ->hasAll(['id', 'title', 'author','blurb', 'page_count', 'year', 'image', 'created_at', 'updated_at', 'genre_id','genre', 'reviews'])
                                    ->whereAllType([
                                        'id' => 'integer',
                                        'title' => 'string',
                                        'author' => 'string',
                                        'blurb' => 'string',
                                        'page_count' => 'integer',
                                        'year' => 'integer',
                                        'image' => 'string',
                                        'genre_id' => 'integer',
                                        'claimed_by_name' =>'string',
                                    ])
                                    
                                    ->whereNot('claimed_by_name','')
                                    ->where('genre_id', 1);
                                    
                            });
                    });
            }
        
        
        
    public function test_add_new_book_success(): void
        {
            $response = $this->postJson('/api/books', [
                'title' => 'James Bond',
                'author' => 'Ian Flemming',
                'blurb' => 'This is a blurb for this book',
                'page_count' => 48,
                'year' => 1964,
                'image' => 'https://picsum.photos/200/300',
                'genre_id' => 1
            ]);
                $response->assertStatus(201)
                        ->assertJson([
                            'message' => 'Book created'
                        ]);
        
        }

     }
