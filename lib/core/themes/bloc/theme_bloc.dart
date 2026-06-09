import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeInitialized>(_onThemeInitialized);
    on<ThemeChanged>(_onThemeChanged);
    on<ThemeFontScaleChanged>(_onFontScaleChanged);
    on<ThemeArabicFontChanged>(_onArabicFontChanged);
  }

  void _onThemeInitialized(
    ThemeInitialized event,
    Emitter<ThemeState> emit,
  ) {
    emit(const ThemeState());
  }

  void _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onFontScaleChanged(
    ThemeFontScaleChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(fontScale: event.scale));
  }

  void _onArabicFontChanged(
    ThemeArabicFontChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(arabicFontFamily: event.fontFamily));
  }
}
