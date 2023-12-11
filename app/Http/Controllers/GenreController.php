<?php

namespace App\Http\Controllers;
use App\Models\Genre;
use Illuminate\Http\Request;

class GenreController extends Controller
{
    private Genre $genre;

    public function __construct(Genre $genre) 
    {
        $this->genre=$genre;
    }

    public function getAllGenres ()
    {
        $genres = $this->genre->all(['id', 'name']);

        return response()->json([
            'data'=> $genres,
            'message'=> 'Genres retrieved', 
        ], 200);
    }




}
