part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.fontScale = 1.0,
    this.arabicFontFamily = 'Amiri',
  });

  final ThemeMode themeMode;

  final double fontScale;

  final String arabicFontFamily;

  ThemeState copyWith({
    ThemeMode? themeMode,
    double? fontScale,
    String? arabicFontFamily,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      fontScale: fontScale ?? this.fontScale,
      arabicFontFamily: arabicFontFamily ?? this.arabicFontFamily,
    );
  }

  @override
  List<Object?> get props => [themeMode, fontScale, arabicFontFamily];
}
