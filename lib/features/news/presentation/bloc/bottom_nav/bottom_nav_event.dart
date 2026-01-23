import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BottomNavClickEvent extends BottomNavEvent {
  final int index;
  BottomNavClickEvent(this.index);

  @override
  List<Object?> get props => [index];
}
