<?php

namespace Tests\Feature;

use App\Models\Genre;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Testing\Fluent\AssertableJson;
use Tests\TestCase;

class GenreTest extends TestCase
{
    use DatabaseMigrations;

    /**
     * Test to view all genres.
     */
    public function test_view_all_genres(): void
    {
        Genre::factory()->create();

        $response = $this->getJson('/api/genres');
        $response->assertStatus(200)
            ->assertJson(function (AssertableJson $json) {
                $json
                    ->hasAll(['message', 'data'])
                    ->has('data', 1, function (AssertableJson $json) {
                        $json
                            ->hasAll([
                                'id',
                                'name',
                            ])
                            ->whereAllType([
                                'id' => 'integer',
                                'name' => 'string',
                            ]);
                    });
            });
    }
}
