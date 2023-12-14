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
    private Claim $claim;

    public function __construct(Book $book, Claim $claim) 
    {
        $this->book=$book;
        $this->claim = $claim;
    }

    public function getAllBooks(Request $request)
    {     
       
        $books = $this->book->all();

        $query = $this->book->query();


        if ($request->has('search')) {
            
            $request->validate(['search'=>'string|min:1|max:255',]);
             
            $query = $query->where(function ($search) use ($request) {
                    $search->orWhere('title', 'LIKE', "%{$request->search}%")
                           ->orWhere('blurb', 'LIKE', "%{$request->search}%")
                           ->orWhere('author', 'LIKE', "%{$request->search}%");
            });
        }
      
        if ($request->has('genre')) {
            $genre = Genre::find($request->genre);
    
            if ($genre) {
                $query = $query->where('genre_id', $genre->id);
            } else {
                return response()->json(['message' => 'Genre not found'], 404);
            }
        }
        
        if ($request->has('claimed')) {

            $request->validate([
                'claimed' => 'integer|min:0|max:1',
            ]);
    
            $claimedValue = $request->claimed;

            if ($claimedValue == 0) {
                $query =  $query->where('claimed_by_name', '');
            } else {
                $query =  $query->where('claimed_by_name', '!=', '');
            }
        }

        $books = $query->get();

        
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

    public function returnBookById(Int $id, Request $request)
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
            'email' => 'required|email',
        ]);

        $book->claim;

        if(is_null($book->claim)) {
            return response()->json([
                'message' => "Book $id is not currently claimed"
            ], 400);
        }

        try {
            $claim = $this->claim->where('book_id', '=', $id)->firstOrFail();
        } catch (Exception $e) {
            return response()->json([
                'message' => "Unexpected error occurred"
            ], 500);
        }

        if ($request->email != $claim->email) {
            return response()->json([
                'message' => "Book $id was not returned. $request->email did not claim this book."
            ], 400);           
        }

        $book->claimed_by_name = '';
   
        if (!$book->save() || !$claim->delete()) {
            return response()->json([
                'message' => "Book $id was not able to be returned"
            ], 500); 
        }
        return response()->json([
            'message' => "Book $id was returned"
        ], 200);


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
