import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListviewWidget extends StatelessWidget {
  final dynamic news;
  const ListviewWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: news.urlToImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 50)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  news.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(news.content),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
