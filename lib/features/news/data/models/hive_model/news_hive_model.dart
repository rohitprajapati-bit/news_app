import 'package:hive/hive.dart';

part 'news_hive_model.g.dart';

@HiveType(typeId: 1)
class NewsHiveModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String urlToImage;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String author;

  @HiveField(5)
  final String content;

  NewsHiveModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.author,
    required this.content,
  });
}
