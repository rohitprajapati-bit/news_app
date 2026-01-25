import 'package:news_app/features/news/data/models/hive_model/news_hive_model.dart';
import 'package:news_app/features/news/domain/entities/news.dart';

extension NewsToHiveMapper on News {
  NewsHiveModel toHiveModel() {
    return NewsHiveModel(
      title: title,
      description: description,
      urlToImage: urlToImage,
      url: url,
      content: content,
    );
  }
}

extension HiveToNewsMapper on NewsHiveModel {
  News toEntity() {
    return News(
      title: title,
      description: description,
      urlToImage: urlToImage,
      url: url,
      content: content,
    );
  }
}
