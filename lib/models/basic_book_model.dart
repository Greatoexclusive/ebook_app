class BasicBookModel {
  final String name;
  final double cover;
  final String url;

  BasicBookModel({
    required this.name,
    required this.cover,
    required this.url,
  });

  factory BasicBookModel.fromJson(Map<String, dynamic> json) {
    return BasicBookModel(
      name: json["name"],
      cover: json["cover"],
      url: json["url"],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "cover": cover,
        "url": url,
      };
}
