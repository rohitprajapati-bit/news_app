import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_event.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/sliver_app_bar_widget.dart';
import 'package:news_app/features/news/presentation/pages/home/widgets/sliver_to_box_adapter_widget.dart';
import 'package:news_app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<NewsBloc>()..add(LoadNewsEvent()),
        ),
        BlocProvider(
          create: (_) => sl<FavCubit>(),
        ),
      ],
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBDCBFF), Color(0xFFFCF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: CustomScrollView(slivers: [buildAppBar(), buildNewsList()]),
      ),
    );
  }
}
