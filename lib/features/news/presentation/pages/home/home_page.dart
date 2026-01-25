import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/injection/injection_container.dart';
import 'package:news_app/core/widgets/app_background.dart';
import 'package:news_app/features/news/presentation/bloc/load_news/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/sliver_app_bar_widget.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/sliver_to_box_adapter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsBloc(sl())..add(LoadNewsEvent()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: CustomScrollView(
          slivers: [SliverAppBarWidget(), SliverToBoxAdapterWidget()],
        ),
      ),
    );
  }
}
