import 'package:ebook_app/core/services/book_service.dart';
import 'package:ebook_app/core/services/pref_services.dart';
import 'package:ebook_app/models/basic_book_model.dart';
import 'package:ebook_app/models/book_model.dart';

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
  List<BasicBookModel> popularList = [];
  static List<BookModel> bookmarkList = [];
  BookModel? detailedBook;

  static final BookService _bookService = BookService();

  getBookList() async {
    await Future.delayed(
        const Duration(milliseconds: 500), (() => getGenreList()));
    await Future.delayed(const Duration(seconds: 1), (() => getPopularList()));
  }

  getGenreList() async {
    genreList = await _bookService.getBooks(genre: tabsList[selectedIndex]);
  }

  getPopularList() async {
    popularList = await _bookService.getPopular();
  }

  getDetails(id) async {
    detailedBook = await _bookService.getById(id: id);
  }

  static addBookmark(BookModel item) {
    bookmarkList.add(item);
    PreferencesServices.storedList.addAll(bookmarkList);
  }

  static removeBookmark(BookModel book) {
    bookmarkList.removeWhere((item) {
      return item.name == book.name;
    });
    PreferencesServices.storedList.addAll(bookmarkList);
  }
}
