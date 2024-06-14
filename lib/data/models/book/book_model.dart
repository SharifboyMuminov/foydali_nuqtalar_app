class BookModel {
  final String title;
  final String context;
  final int order;
  final bool isFree;

  BookModel({
    required this.order,
    required this.isFree,
    required this.context,
    required this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      context: json["translate"]["uz"]["context"] as String? ?? "",
      title: json["translate"]["uz"]["title"] as String? ?? "",
      order: json["order"] as int? ?? 1,
      isFree: json["is_free"] as bool? ?? false,
    );
  }
}
