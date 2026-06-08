import 'package:flutter/material.dart';
import 'package:manzil/core/themes/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  // ── Display ───────────────────────────────────
  static TextStyle displayLarge({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 56,
    fontWeight: FontWeight.w700,
    height: 1.12,
    letterSpacing: -0.5,
    color: color ?? AppColors.cPrimary,
  );

  static TextStyle displayMedium({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 44,
    fontWeight: FontWeight.w700,
    height: 1.16,
    color: color ?? AppColors.cPrimary,
  );

  static TextStyle displaySmall({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.22,
    color: color ?? AppColors.cPrimary,
  );

  // ── Headlines ─────────────────────────────────
  static TextStyle headlineLarge({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.29,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle headlineSmall({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: color ?? AppColors.cTextPrimary,
  );

  // ── Titles ─────────────────────────────────────
  static TextStyle titleLarge({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
    letterSpacing: 0.0,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle titleMedium({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.50,
    letterSpacing: 0.15,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle titleSmall({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: color ?? AppColors.cTextPrimary,
  );

  // ── Body ───────────────────────────────────────
  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.75,
    letterSpacing: 0.5,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.71,
    letterSpacing: 0.25,
    color: color ?? AppColors.cTextSecondary,
  );

  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.67,
    letterSpacing: 0.4,
    color: color ?? AppColors.cTextHint,
  );

  // ── Labels ─────────────────────────────────────
  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: color ?? AppColors.cTextPrimary,
  );

  static TextStyle labelMedium({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.5,
    color: color ?? AppColors.cTextSecondary,
  );

  static TextStyle labelSmall({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.5,
    color: color ?? AppColors.cTextHint,
  );

  // ── Quran / Arabic Script ──────────────────────
  static TextStyle quranAyah({Color? color, double fontSize = 28}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    height: 2.0,
    letterSpacing: 0.0,
    color: color ?? AppColors.cPrimary800,
  );

  static TextStyle surahName({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: color ?? AppColors.cGold,
  );

  static TextStyle bismillah({Color? color}) => TextStyle(
    fontFamily: 'Amiri',
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.8,
    color: color ?? AppColors.cPrimary700,
  );

  static TextStyle verseNumber({Color? color}) => TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: color ?? AppColors.cSecondary700,
  );

  // ── Special / Decorative ──────────────────────
  static TextStyle sectionLabel({Color? color}) => TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
    color: color ?? AppColors.cPrimary,
  );

  static TextStyle numberDisplay({Color? color, double fontSize = 48}) => TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
    height: 1.0,
    color: color ?? AppColors.cPrimary,
  );

  static TextStyle caption({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.4,
    color: color ?? AppColors.cTextHint,
  );

  static TextStyle button({Color? color}) => TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.5,
    color: color ?? AppColors.cTextOnPrimary,
  );
}