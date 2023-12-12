<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Genre;
use Exception;
use Illuminate\Http\Request;

class BookController extends Controller
{

    private Book $book;

    public function __construct(Book $book) 
    {
        $this->book=$book;

    }

    public function getAllBooks(Request $request)
    {     
       
        $books = $this->book->all();
       
        if ($request->has('genre')) {
            $genre = Genre::where('name', $request->genre)->first();
    
            if ($genre) {
                $books = $books->where('genre_id', $genre->id);
            } else {
                return response()->json(['message' => 'Genre not found'], 404);
            }
        }

        foreach($books as $book) {
            $book->genre->name;
            $book->reviews;
        }

        return response()->json([
            'message' => 'Books successfully retrived', 
            'data' => $books
        ], 200);
    }

    public function getBookById(Int $id)
    {
        try {
            $book = $this->book->findOrFail($id);
        } catch (Exception $e) {
            return response()->json([
                'message' => "Book with id $id not found"
            ], 404);
        }

        $book->reviews;
        $book->genre;

        return response()->json([
            'message' => 'Book successfully found',
            'data' => $book
        ], 200);
    }
}
