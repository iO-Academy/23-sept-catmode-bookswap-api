<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Tests\TestCase;

class GenreTest extends TestCase
{
    use DatabaseMigrations;
    /**
     * A basic test example.
     */
    public function test_view_all_genres(): void
    {
        $response = $this->get('/api/genres');

        $response
        ->assertStatus(200)
        ->assertJson(['message'=>'Genres retrieved']);
    }
}
