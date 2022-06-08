import 'package:ebook_app/core/services/book_service.dart';
import 'package:ebook_app/models/basic_book_model.dart';

class AllFuction {
  int selectedIndex = 0;
  List<String> tabsList = [
    "Romance",
    "Mystery",
    "Thriller",
    "Sci-Fi",
    "Historical",
    "Fantasy",
    "Horror"
  ];
  List<BasicBookModel> genreList = [];

  static final BookService _bookService = BookService();

  getBookList() async {
    genreList.addAll(await _bookService.getBooks());
  }
}
