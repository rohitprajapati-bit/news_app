import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:news_app/core/network/api_client.dart';
import 'package:news_app/features/news/data/datasources/news_remote_datasource.dart';
import 'package:news_app/features/news/data/models/hive_model/news_hive_model.dart';
import 'package:news_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:news_app/features/news/domain/usecases/get_top_headlines.dart';
import 'package:news_app/features/news/presentation/bloc/load_news/news_bloc.dart';
import 'package:news_app/features/news/presentation/cubit/fav_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ApiClient());

  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl()));

  final favBox = Hive.box<NewsHiveModel>('favorites');
  sl.registerLazySingleton(() => favBox);

  sl.registerLazySingleton(() => GetTopHeadlines(sl()));

  sl.registerFactory(() => NewsBloc(sl()));
  sl.registerFactory(() => FavCubit(sl()));
}
