<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Book;  // استدعاء الموديل
use Illuminate\Http\Request;

class BookController extends Controller
{
    // جميع الكتب
    public function index()
    {
        $books = Book::all(); // جلب كل الكتب من DB
        return response()->json(['books' => $books]);
    }

    // كتاب محدد
    public function show($id)
    {
        $book = Book::find($id);
        if ($book) {
            return response()->json($book);
        } else {
            return response()->json(['message' => 'Book not found'], 404);
        }
    }

    // المقترحة
    public function recommended()
    {
        return response()->json(['books' => Book::all()]);
    }

    // الأكثر مبيعاً
    public function bestSeller()
    {
        return response()->json(['books' => Book::all()]);
    }

    // التخفيضات
    public function flashSale()
    {
        return response()->json(['books' => Book::all()]);
    }
}
