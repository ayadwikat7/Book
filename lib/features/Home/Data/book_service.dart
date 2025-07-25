import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
  static const String baseUrl = "http://192.168.1.3:8000/api";

  Future<List<Map<String, dynamic>>> getBestSellerBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/books/best-seller'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['books'] != null && data['books'] is List) {
        return List<Map<String, dynamic>>.from(data['books']);
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to fetch books: ${response.statusCode}");
    }
  }

  Future<List<Map<String, dynamic>>> getRecommendedBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/books/recommended'));    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['books'] != null && data['books'] is List) {
        return List<Map<String, dynamic>>.from(data['books']);
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to fetch recommended books: ${response.statusCode}");
    }
  }

  Future<List<Map<String, dynamic>>> getFlashSaleBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/books/flash-sale'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['books'] != null && data['books'] is List) {
        return List<Map<String, dynamic>>.from(data['books']);
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to fetch flash sale books: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> getBookDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/books/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch book details: ${response.statusCode}");
    }
  }
}
