class BasicBookModel {
  final String bookId;
  final String name;
  final String cover;
  final String url;

  BasicBookModel({
    required this.bookId,
    required this.name,
    required this.cover,
    required this.url,
  });

  factory BasicBookModel.fromJson(Map<String, dynamic> json) {
    return BasicBookModel(
      bookId: json["book_id"].toString(),
      name: json["name"],
      cover: json["cover"],
      url: json["url"],
    );
  }
  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "name": name,
        "cover": cover,
        "url": url,
      };
}
