import 'package:ebook_app/models/basic_book_model.dart';
import 'package:ebook_app/models/book_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BookService {
  final baseURL = "https://hapi-books.p.rapidapi.com";
  final header = {
    "hapi-books.p.rapidapi.com": "X-RapidAPI-Host",
    "X-RapidAPI-Key": "ce67575aadmsh51c6aa6540a5cc7p19c031jsn2184d6e083b3",
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
  // Future<List<BookModel>> getSearchedBooks() async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse(
  //           "$baseURL/search/the+walking+dead",
  //         ),
  //         headers: {
  //           host: hostKey,
  //           api: apiKey,
  //         });

  //     final data = jsonDecode(response.body);

  //     final List<BookModel> searchedBookList = List<BookModel>.from(
  //       data.map(
  //         (e) => BookModel.fromJson(e),
  //       ),
  //     );
  //     return searchedBookList;
  //   } catch (e) {
  //     // print("Error is $e");
  //     rethrow;
  //   }
  // }
}
