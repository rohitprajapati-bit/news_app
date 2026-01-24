import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_app/features/news/data/mappers/news_hive_mapper.dart';
import 'package:news_app/features/news/data/models/hive_model/news_hive_model.dart';
import 'package:news_app/features/news/domain/entities/news.dart';

class FavCubit extends Cubit<List<News>> {
  final Box<NewsHiveModel> _favBox;

  FavCubit(this._favBox) : super([]) {
    loadFavorites();
  }

  void loadFavorites() {
    final favorites = _favBox.values.map((e) => e.toEntity()).toList();
    emit(favorites);
  }

  Future<void> toggleFavorite(News news) async {
    final isFav = _favBox.containsKey(news.url);

    if (isFav) {
      await _favBox.delete(news.url);
    } else {
      await _favBox.put(news.url, news.toHiveModel());
    }
    loadFavorites();
  }
}
