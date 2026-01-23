import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:news_app/features/news/presentation/bloc/bottom_nav/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState(index: 0)) {
    on<BottomNavClickEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}