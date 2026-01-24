import 'package:news_app/features/news/domain/entities/news.dart';

abstract class NewsState {}
class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<News> news;
  NewsLoaded(this.news);
}
class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}
