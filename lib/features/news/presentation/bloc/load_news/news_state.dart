part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> allNews;
  final List<News> filteredNews;
  const NewsLoaded({ required this.allNews, required this.filteredNews});

  @override
  List<Object?> get props => [allNews, filteredNews];
}

class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
