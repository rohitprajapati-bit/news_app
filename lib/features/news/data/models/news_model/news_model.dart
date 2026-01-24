import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required String title,
    required String description,
    required String urlToImage,
    required String url,
    required String author,
    required String content,
    
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson({
        "title": json["title"] ?? "",
        "description": json["description"] ?? "",
        "urlToImage": json["urlToImage"] ?? "",
        "url": json["url"] ?? "",
        "author": json["author"] ?? "",
        "content": json["content"] ?? "",
      });
}
