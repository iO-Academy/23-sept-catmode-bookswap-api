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
