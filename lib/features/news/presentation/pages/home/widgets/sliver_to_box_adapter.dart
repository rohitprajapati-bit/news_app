import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/router/app_routes.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_state.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';
import 'package:news_app/features/news/domain/entities/news.dart';

// SliverToBoxAdapter buildNewsList() {
//   return
  


// }


class SliverToBoxAdapterWidget extends StatelessWidget {
  const SliverToBoxAdapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    SliverToBoxAdapter(
    child: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        // LOADING
        if (state is NewsLoading) {
          return const Padding(
            padding: EdgeInsets.all(50),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        // ERROR
        if (state is NewsError) {
          return Center(child: Text(state.message));
        }
        // SUCCESS
        if (state is NewsLoaded) {
          final newsList = state.news;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.detail, extra: news);
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            news.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const SizedBox(
                              height: 200,
                              child: Center(child: Icon(Icons.image, size: 50)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          news.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          news.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.push(AppRoutes.detailWeb, extra: news);
                            },
                            child: Text(
                              'Read More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),

                          BlocBuilder<FavCubit, List<News>>(
                            builder: (context, favList) {
                              final isFav = favList.any(
                                (e) => e.url == news.url,
                              );

                              return IconButton(
                                onPressed: () {
                                  context.read<FavCubit>().toggleFavorite(news);
                                },
                                icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: isFav ? Colors.red : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    ),
  );

  }
}