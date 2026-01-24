import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';

class FavPage extends StatelessWidget {
  final List<dynamic>? allNews; // Home se newsList pass hogi

  const FavPage({super.key, this.allNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: BlocBuilder<FavCubit, Set<int>>(
        builder: (context, favSet) {
          // Filter favorite news
          final favNews = allNews?.asMap()
              .entries
              .where((e) => favSet.contains(e.key))
              .map((e) => e.value)
              .toList();

          if (favNews?.isEmpty ?? true) {
            return const Center(child: Text("No Favorites Yet ❤️"));
          }

          return ListView.builder(
            itemCount: favNews?.length ?? 0,
            itemBuilder: (context, index) {
              final news = favNews?[index];

              return ListTile(
                leading: Image.network(
                  news.imageUrl,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(news.title),
                subtitle: Text(news.description, maxLines: 2),
                trailing: const Icon(Icons.favorite, color: Colors.red),
              );
            },
          );
        },
      ),
    );
  }
}
