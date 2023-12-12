<?php

namespace App\Http\Controllers;

use App\Models\Book;
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

}
