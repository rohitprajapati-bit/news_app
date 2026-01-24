import 'package:news_app/features/news/data/models/news_model/news_model.dart';
import 'package:news_app/features/news/domain/entities/news.dart';

extension NewsMapper on NewsModel {
  News toEntity() => News(
    title: title,
    description: description,
    imageUrl: urlToImage,
    content: content,
    url: url,
  );
}