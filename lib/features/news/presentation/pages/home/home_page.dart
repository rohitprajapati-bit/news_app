import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/search_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBDCBFF), Color(0xFFFCF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Browse',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              floating: true,
              pinned: true,
              snap: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Discover things of this world'),
                    SizedBox(height: 30),
                    SearchFieldWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
