import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/search_field_widget.dart';

SliverAppBar buildAppBar() {
  return SliverAppBar(
    pinned: true,
    floating: true,
    snap: true,
    expandedHeight: 180,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Browse',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Discover things of this world', style: TextStyle(fontSize: 12)),
      ],
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        padding: const EdgeInsets.fromLTRB(16, 110, 16, 16),
        decoration: const BoxDecoration(),
        child: const SearchFieldWidget(),
      ),
    ),
  );
}
