import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { light, dark, system }

class ThemeCubit extends Cubit<AppThemeMode> {
  ThemeCubit() : super(AppThemeMode.system);

  void setLight() => emit(AppThemeMode.light);
  void setDark() => emit(AppThemeMode.dark);
  void setSystem() => emit(AppThemeMode.system);
}
