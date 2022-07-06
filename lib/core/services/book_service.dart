import 'package:ebook_app/models/basic_book_model.dart';
import 'package:ebook_app/models/book_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BookService {
  final baseURL = "https://hapi-books.p.rapidapi.com";
  final header = {
    "hapi-books.p.rapidapi.com": "X-RapidAPI-Host",
    "X-RapidAPI-Key": "7fbcb088d9msh3ce824fe7ecb2cbp1731d7jsn77469f7fdd18",
  };

  Future<List<BasicBookModel>> getBooks({required String genre}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/week/$genre",
        ),
        headers: header,
      );

      final data = jsonDecode(response.body);
      print(data);
      final List<BasicBookModel> basicBookList = List<BasicBookModel>.from(
        data.map(
          (e) => BasicBookModel.fromJson(e),
        ),
      );
      return basicBookList;
    } catch (e) {
      // print("Error is $e");
      rethrow;
    }
  }

  Future<List<BasicBookModel>> getPopular() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
            "$baseURL/month/2022/6",
          ),
          headers: header);

      final data = jsonDecode(response.body);
      final List<BasicBookModel> popularList = List<BasicBookModel>.from(
        data.map(
          (e) => BasicBookModel.fromJson(e),
        ),
      );
      return popularList;
    } catch (e) {
      // print("Error is $e");
      rethrow;
    }
  }

  Future<BookModel> getById({required String id}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
            "$baseURL/book/$id",
          ),
          headers: header);

      final data = jsonDecode(response.body);
      BookModel book = BookModel.fromJson(data);

      return book;
    } catch (e) {
      // print("Error is $e");
      rethrow;
    }
  }

  Future<List<BasicBookModel>> getSearchedBooks({required String q}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/search/$q",
        ),
        headers: header,
      );

      final data = jsonDecode(response.body);

      final List<BasicBookModel> searchedBookList = List<BasicBookModel>.from(
        data.map(
          (e) => BasicBookModel.fromJson(e),
        ),
      );
      return searchedBookList;
    } catch (e) {
      // print("Error is $e");
      rethrow;
    }
  }
}
