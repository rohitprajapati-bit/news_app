import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/app_background.dart';
import 'package:news_app/features/news/domain/entities/news.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';
import 'package:news_app/features/news/presentation/pages/favorites/widget/listview_builder_widget.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBDCBFF),
        title: const Text("Favorites"),
      ),
      body: BlocBuilder<FavCubit, List<News>>(
        builder: (context, favNews) {
          if (favNews.isEmpty) {
            return const Center(child: Text("No Favorites Yet ❤️"));
          }
          return AppBackground(child: ListviewBuilderWidget(favNews: favNews));
        },
      ),
    );
  }
}
