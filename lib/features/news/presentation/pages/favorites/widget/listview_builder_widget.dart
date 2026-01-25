import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/core/router/app_routes.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';

class ListviewBuilderWidget extends StatelessWidget {
  final dynamic favNews;
  const ListviewBuilderWidget({super.key, required this.favNews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favNews.length,
      itemBuilder: (context, index) {
        final news = favNews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 119, 153, 212),
              ),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Color(0xFFBDCBFF), Color.fromARGB(255, 140, 157, 226)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              onTap: () {
                context.push(AppRoutes.detailWeb, extra: news);
              },
              leading: CachedNetworkImage(
                imageUrl: news.urlToImage,
                width: 60,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
              ),
              title: Text(news.title),
              subtitle: Text(news.description, maxLines: 2),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  context.read<FavCubit>().toggleFavorite(news);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
