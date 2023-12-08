<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;

class BookController extends Controller
{

    private Book $book;

    public function __construct(Book $book) 
    {
        $this->book=$book;
    }

    public function getAllBooks()
    {
        $books = $this->book->all();

        foreach($books as $book) {
            $book->genre->name;
            $book->reviews;
        }

        return response()->json([
            'message' => 'Books successfully retrived', 
            'data' => $books
        ], 200);
    }
}
