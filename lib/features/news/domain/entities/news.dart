import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String content;

  const News({required this.title, required this.content});

  @override
  List<Object?> get props => [title, content];
}
