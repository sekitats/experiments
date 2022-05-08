import '../constants/constants.dart';

class ArticlesModel {
  ArticlesModel({
    required this.articleId,
    required this.articleName,
    required this.articleRoute,
    required this.articleContent,
    required this.status,
    required this.createdAt,
  });

  String articleId;
  String articleName;
  String articleRoute;
  String articleContent;
  Status status;
  DateTime? createdAt;
}
