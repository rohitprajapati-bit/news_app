import 'package:bloc/bloc.dart';

class FavCubit extends Cubit<Set<int>> {
  FavCubit() : super({});

  void toggleFavorite(int index) {
    final newSet = Set<int>.from(state);

    if (newSet.contains(index)) {
      newSet.remove(index);
    } else {
      newSet.add(index);
    }
    emit(newSet);
  }
}