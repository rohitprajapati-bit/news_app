import 'package:news_app/features/news/data/models/news_model.dart';

class News {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String url;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    required this.url,
  });
}

extension NewsMapper on NewsModel {
  News toEntity() => News(
    title: title,
    description: description,
    imageUrl: urlToImage,
    content: content,
    url: url,
  );
}
