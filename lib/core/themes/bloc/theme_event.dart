part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

final class ThemeInitialized extends ThemeEvent {
  const ThemeInitialized();
}

final class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

final class ThemeFontScaleChanged extends ThemeEvent {
  const ThemeFontScaleChanged(this.scale);

  final double scale;

  @override
  List<Object?> get props => [scale];
}

final class ThemeArabicFontChanged extends ThemeEvent {
  const ThemeArabicFontChanged(this.fontFamily);

  final String fontFamily;

  @override
  List<Object?> get props => [fontFamily];
}
