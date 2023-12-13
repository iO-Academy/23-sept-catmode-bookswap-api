<?php

namespace App\Http\Controllers;
use App\Models\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function addBookReview (Request $request) 
    {
            // Validating the request data
            $request->validate([
                'name' => 'required|string|min:1|max:255',
                'rating' => 'required|integer|min:0|max:5',
                'review' => 'required|string|max:1000',
                'book_id' => 'required|integer',
            ]);
    
            // Add the request data to a new product
            $new_review = new Review();
            $new_review->name = $request->name;
            $new_review->rating = $request->rating;
            $new_review->review = $request->review;
            $new_review->book_id = $request->book_id;
    
            if($new_review->save()) {
                return response()->json([
                    'message' => "Review created"
                ], 201);
            }
    
            return response()->json([
                'message' => "Unexpected error occurred"
            ], 500);
    }
}
