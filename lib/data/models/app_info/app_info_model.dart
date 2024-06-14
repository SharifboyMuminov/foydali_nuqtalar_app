class AppInfoModel {
  String youtube;
  String content;

  AppInfoModel({
    required this.youtube,
    required this.content,
  });

  factory AppInfoModel.fromJson(Map<String, dynamic> json) {
    return AppInfoModel(
      youtube: json['youtube'] as String? ?? "",
      content: json['content'] as String? ?? "",
    );
  }

  factory AppInfoModel.initial() {
    return AppInfoModel(youtube: '', content: '');
  }
}
