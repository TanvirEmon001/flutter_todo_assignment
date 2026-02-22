import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  static const String themeKey = 'app_theme_mode';

  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.light)) {

    on<LoadThemeEvent>(_onLoadTheme);
    on<ToggleThemeEvent>(_onToggleTheme);
  }


  Future<void> _onLoadTheme(
      LoadThemeEvent event,
      Emitter<ThemeState> emit,
      ) async {
    try {

      final prefs = await SharedPreferences.getInstance();

      final isDark = prefs.getBool(themeKey) ?? false;

      emit(ThemeState(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      ));
    } catch (e) {

      emit(const ThemeState(themeMode: ThemeMode.light));
    }
  }

  Future<void> _onToggleTheme(
      ToggleThemeEvent event,
      Emitter<ThemeState> emit,
      ) async {

    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    try {

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(themeKey, newThemeMode == ThemeMode.dark);

      emit(ThemeState(themeMode: newThemeMode));
    } catch (e) {

      emit(ThemeState(themeMode: newThemeMode));
    }
  }
}