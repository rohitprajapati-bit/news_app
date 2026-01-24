import 'package:news_app/core/network/api_endpoints.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/features/news/data/models/news_model/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getTopHeadlines();
}

class NewsRemoteDataSourceImpl extends ApiService
    implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl(super.client);
  @override
  Future<List<NewsModel>> getTopHeadlines() async {
    final response = await getApi(
      ApiEndpoints.topHeadlines,
      query: {
        "q": "apple",
        "from": "2026-01-22",
        "to": "2026-01-22",
        "sortBy": "popularity",
        "apiKey": "d14e1d2592c645ad962ddf6f226b09bf",
      },
    );
    return (response.data["articles"] as List)
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}
