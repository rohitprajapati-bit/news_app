import 'package:equatable/equatable.dart';

class BottomNavState extends Equatable {
  final int index;
  const BottomNavState({required this.index});

  BottomNavState copyWith({int? index}) {
    return BottomNavState(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}
