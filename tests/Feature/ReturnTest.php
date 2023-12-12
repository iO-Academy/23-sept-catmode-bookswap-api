<?php

namespace Tests\Feature;

use App\Models\Claim;
use App\Models\Book;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Tests\TestCase;
use Exception;

class ReturnTest extends TestCase
{
    use DatabaseMigrations;

    public function test_return_book_by_id_success(): void
    {
        $claim = Claim::factory()->create();

        $response = $this->putJson('/api/books/return/1', ['email'=>"$claim->email"]);

        $response->assertStatus(200)
                 ->assertJson([
                    'message' => 'Book 1 was returned'
                 ]);
                
    } 

    public function test_return_book_by_id_invalid_book_not_found(): void
    {
        $response = $this->putJson('/api/books/return/5', ['email'=>"test@test.com"]);

        $response->assertStatus(404)
                 ->assertJson([
                    'message' => 'Book 5 was not found'
                 ]);
                
    } 

    public function test_return_book_by_id_invalid_book_not_claimed(): void
    {
       
        $claim = Claim::factory()->create();
        $book = Book::factory()->create();

        $book->claimed_by_name = '';
        $claim->book_id = $book->id;

        $claim->save();
        $book->save();
    
        $response = $this->putJson('/api/books/return/1', ['email'=>"$claim->email"]);

        $response->assertStatus(400)
                 ->assertJson([
                    'message' => 'Book 1 is not currently claimed'
                 ]);
                
    } 

    public function test_return_book_by_id_invalid_email(): void
    {
        $claim = Claim::factory()->create();

        $response = $this->putJson('/api/books/return/1', ['email'=>"test123@test.com"]);

        $response->assertStatus(400)
                 ->assertJson([
                    'message' => 'Book 1 was not returned. test123@test.com did not claim this book.'
                 ]);
                
    } 


    public function test_return_book_by_id_invalid_no_email(): void
    {
        $claim = Claim::factory()->create();

        $response = $this->putJson('/api/books/return/1', ['email'=>""]);

        $response->assertStatus(422)
                 ->assertJson([
                    'message' => 'The email field is required.'
                 ]);
                
    } 



    // public function test_return_book_by_id_server_error(): void
    // {
    //     Claim::factory()->create();
    //     $response = $this->putJson('/api/books/return/1', ['email'=>"test@test.com"]);
        
    //     abort(500);

    //     try {
            
    //     } catch (Exception $e) {
    //         $response->assertServerError()
    //         ->assertJson([
    //            'message' => 'Book 1 was returned'
    //         ]);
    //     }
    // }
}
