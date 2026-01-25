import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entities/news.dart';
import 'package:news_app/features/news/domain/usecases/get_top_headlines.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlines getTopHeadlines;

  NewsBloc(this.getTopHeadlines) : super(NewsLoading()) {
    on<LoadNewsEvent>(_load);
    on<SearchNewsEvent>(_search);
  }

  Future<void> _load(LoadNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final data = await getTopHeadlines();
      emit(NewsLoaded(allNews: data, filteredNews: data));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void _search(SearchNewsEvent event, Emitter<NewsState> emit) {
    if (state is NewsLoaded) {
      final current = state as NewsLoaded;

      final filtered = current.allNews.where((news) {
        return news.title.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(NewsLoaded(allNews: current.allNews, filteredNews: filtered));
    }
  }
}
