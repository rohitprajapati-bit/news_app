import 'package:news_app/features/news/domain/entities/news.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

class GetTopHeadlines {
  final NewsRepository repo;

  GetTopHeadlines(this.repo);

  Future<List<News>> call() => repo.getTopHeadlines();
}
