class BookModel {
  final String bookId;
  final String name;
  final String cover;
  final String url;
  final String rating;
  final String pages;
  final String synopsis;
  final String publishedDate;
  final List<String> authors;

  BookModel({
    required this.bookId,
    required this.name,
    required this.cover,
    required this.url,
    required this.rating,
    required this.synopsis,
    required this.pages,
    required this.publishedDate,
    required this.authors,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json["book_id"].toString(),
      name: json["name"],
      cover: json["cover"],
      url: json["url"],
      authors: List<String>.from(json["authors"]),
      rating: json['rating'].toString(),
      publishedDate: json['published_date'],
      synopsis: json['synopsis'],
      pages: json['pages'].toString(),
    );
  }
  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "name": name,
        "cover": cover,
        "url": url,
        "authors": authors,
        "published_date": publishedDate,
        'rating': rating,
        'synopsis': synopsis,
        'pages': pages
      };
}
