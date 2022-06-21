
import 'dart:convert';
import 'package:ebook_app/models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("getting stored savedData");
    getSavedList();
    print("gotten stored savedData");
  }

  static List<BookModel> storedList = [];
  
  static const bookmarkedListKey = "StoredList";

  Future<void> saveBookmarkList(List<BookModel> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(bookmarkedListKey, jsonEncode(item));
  }

  Future<void> getSavedList() async {
    List<BookModel> saved = [];
    saved = jsonDecode(
            _preferences.getString(bookmarkedListKey) ?? <String>[].toString())
        .map<BookModel>((e) => e as BookModel)
        .toList();
    storedList.addAll(saved);
  }
}