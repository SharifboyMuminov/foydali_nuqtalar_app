class BookModel {
  final String title;
  final String context;

  BookModel({
    required this.context,
    required this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      context: json["context"] as String? ?? "",
      title: json["title"] as String? ?? "",
    );
  }
}
