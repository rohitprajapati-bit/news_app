import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/domain/usecases/get_top_headlines.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlines getTopHeadlines;

  NewsBloc(this.getTopHeadlines) : super(NewsLoading()) {
    on<LoadNewsEvent>(_load);
  }

  Future<void> _load(LoadNewsEvent e, Emitter emit) async {
    emit(NewsLoading());
    try {
      final data = await getTopHeadlines();
      emit(NewsLoaded(data));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}

