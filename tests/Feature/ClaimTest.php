<?php

namespace Tests\Feature;

use App\Models\Claim;
use App\Models\Book;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Testing\Fluent\AssertableJson;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Tests\TestCase;

class ClaimTest extends TestCase
{
    use DatabaseMigrations;

    public function test_claim_book_by_id_success(): void
    {
        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/1', ['book_id'=> 1 , 'name'=>'Timi', 'email'=>'test@test.com']);

        $response->assertStatus(200)
                 ->assertJson([
                    'message' => 'Book 1 was claimed'
                 ]);
                
    } 

    public function test_claim_book_by_id_claimed(): void
    {
        Claim::factory()->create();
        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/1', ['book_id'=> 1 , 'name'=>'Timi', 'email'=>'test@test.com']);

        $response->assertStatus(400)
                 ->assertJson([
                    'message' => 'Book 1 is already claimed'
                 ]);
                
    }

    public function test_claim_book_by_id_invalid(): void
    {

        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/2', ['book_id'=> 2 , 'name'=>'Timi', 'email'=>'test@test.com']);

        $response->assertStatus(404)
                 ->assertJson([
                    'message' => 'Book 2 was not found'
                 ]);
                
    }

    public function test_claim_book_by_id_email_invalid(): void
    {

        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/1', ['book_id'=> 1 , 'name'=>'Timi', 'email'=>'']);

        $response->assertStatus(422)
                 ->assertJson([
                    'message' => "The email field is required."
                 ]);
                
    }

    public function test_claim_book_by_id_name_invalid(): void
    {

        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/1', ['book_id'=> 1 , 'name'=>'', 'email'=>'test@test.com']);

        $response->assertStatus(422)
                 ->assertJson([
                    'message' => "The name field is required."
                 ]);
                
    }

    public function test_claim_book_by_id_both_invalid(): void
    {

        Book::factory()->create();

        $response = $this->putJson('/api/books/claim/1', ['book_id'=> 1 , 'name'=>'', 'email'=>'']);

        $response->assertStatus(422)
                 ->assertJson([
                    'message' => "The name field is required. (and 1 more error)"
                 ]);
                
    } 
}
