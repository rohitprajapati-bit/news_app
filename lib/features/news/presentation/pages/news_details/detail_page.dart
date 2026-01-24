import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/app_background.dart';
import 'package:news_app/features/news/presentation/pages/news_details/widgets/listview_widget.dart';

class DetailPage extends StatelessWidget {
  final dynamic news;
  const DetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBDCBFF),
        elevation: 0,
        title: const Text('Details'),
      ),
      body: AppBackground(child: ListviewWidget(news: news)),
    );
  }
}
