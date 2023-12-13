<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Genre;
use App\Models\Claim;
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
            $genre = Genre::find($request->genre);
    
            if ($genre) {
                $books = $books->where('genre_id', $genre->id);
            } else {
                return response()->json(['message' => 'Genre not found'], 404);
            }
        }
        
        if ($request->claimed != null) {
            $request->validate([
                'claimed' => 'integer|min:0|max:1',
            ]);

            if ($request->claimed == 1) {
                $books = $this->book->where('claimed_by_name', '!=', '')->get();
            } else {
                $books = $this->book->where('claimed_by_name', '=', '')->get();  
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

    public function claimBookById(Int $id, Request $request)
    {
        try {
            $book = $this->book->findOrFail($id);
        } catch (Exception $e) {
            return response()->json([
                'message' => "Book $id was not found"
            ], 404);
        }

        // Validating the request data
        $request->validate([
            'name' => 'required|string|min:1|max:255',
            'email' => 'required|email',
        ]);

        $book->claim;

        if(!is_null($book->claim)) {
            return response()->json([
                'message' => "Book $id is already claimed"
            ], 400);
        }

        // Add the request data to a new claim
        $new_claim = new Claim();
        $new_claim->book_id = $id;       
        $new_claim->name = $request->name;
        $new_claim->email = $request->email;

        $book->claimed_by_name = $request->name;
        $book->save();

        if($new_claim->save()) {
        return response()->json([
            'message' => "Book $id was claimed"
        ], 200);
        }
    }

    public function addNewBook(Request $request)
    {
        $request->validate([
            'title' => 'required|string|min:5|max:255',
            'author' => 'required|string|min:5|max:255',
            'genre_id' => 'required|integer|max:20',
            'blurb' => 'string|max:255',
            'page_count' => 'required|integer',
            'image' => 'string|max:255|url',
            'year' => 'integer|max:9999'
        ]);

        $new_book = new Book();
        $new_book->title = $request->title;
        $new_book->author = $request->author;
        $new_book->genre_id = $request->genre_id;
        $new_book->blurb = $request->blurb;
        $new_book->page_count = $request->page_count;
        $new_book->image = $request->image;
        $new_book->year = $request->year;

        if($new_book->save()) {
            return response()->json([
                'message' => "Book created"
            ], 201);
        }
  
        return response()->json([
            'message' => "Unexpected error occurred"
        ], 500);
    }
}
