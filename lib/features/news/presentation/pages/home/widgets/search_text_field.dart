import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/load_news/news_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<NewsBloc>().add(SearchNewsEvent(value));
      },
      decoration: InputDecoration(
        hintText: 'Search by title...',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.search_outlined),
      ),
    );
  }
}
