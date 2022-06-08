import 'package:ebook_app/models/basic_book_model.dart';
import 'package:ebook_app/models/book_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BookService {
  final String hostKey = "hapi-books.p.rapidapi.com";
  final String apiKey = "148d48a70fmsh276705c95335d87p1b884cjsn5d365f301f60";
  final String host = "X-RapidAPI-Host";
  final String api = "X-RapidAPI-Key";
  final baseURL = "https://hapi-books.p.rapidapi.com/week";

  Future<List<BasicBookModel>> getBooks() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
            "$baseURL+/horror",
          ),
          headers: {
            host: hostKey,
            api: apiKey,
          });

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
