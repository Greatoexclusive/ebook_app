class BookModel {
  final String name;
  final double cover;
  final String url;
  final String rating;
  final String createdEditions;
  final String year;
  final List<String> authors;

  BookModel({
    required this.name,
    required this.cover,
    required this.url,
    required this.rating,
    required this.createdEditions,
    required this.year,
    required this.authors,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      name: json["name"],
      cover: json["cover"],
      url: json["url"],
      authors: List<String>.from(json["authors"]),
      createdEditions: json['created_editions'].toString(),
      rating: json['rating'].toString(),
      year: json['year'].toString(),
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "cover": cover,
        "url": url,
        "authors": authors,
        'created_editions': createdEditions,
        'rating': rating,
        'year': year
      };
}
