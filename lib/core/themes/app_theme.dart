import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  // ════════════════════════════════════════════
  //  LIGHT THEME
  // ════════════════════════════════════════════
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      // ── Color Scheme ─────────────────────────
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.cPrimary,
        onPrimary: AppColors.cTextOnPrimary,
        primaryContainer: AppColors.cPrimary100,
        onPrimaryContainer: AppColors.cPrimary900,
        secondary: AppColors.cSecondary,
        onSecondary: AppColors.cTextOnSecondary,
        secondaryContainer: AppColors.cSecondary100,
        onSecondaryContainer: AppColors.cSecondary900,
        tertiary: AppColors.cTeal,
        onTertiary: AppColors.cTextOnPrimary,
        tertiaryContainer: Color(0xFFB2DFDB),
        onTertiaryContainer: Color(0xFF00352F),
        error: AppColors.cError,
        onError: Colors.white,
        errorContainer: AppColors.cErrorContainer,
        onErrorContainer: AppColors.cError,
        surface: AppColors.cSurface,
        onSurface: AppColors.cTextPrimary,
        surfaceContainerHighest: AppColors.cSurfaceVariant,
        onSurfaceVariant: AppColors.cTextSecondary,
        outline: AppColors.cBorder,
        outlineVariant: AppColors.cDivider,
        shadow: AppColors.cShadow,
        scrim: AppColors.cScrim,
        inversePrimary: AppColors.cPrimary300,
      ),

      scaffoldBackgroundColor: AppColors.cBackground,

      // ── Typography ───────────────────────────
      textTheme: _buildTextTheme(),

      // ── AppBar ───────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cPrimary,
        foregroundColor: AppColors.cTextOnPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineLarge(
          color: AppColors.cTextOnPrimary,
        ),
        iconTheme: const IconThemeData(color: AppColors.cTextOnPrimary),
        actionsIconTheme: const IconThemeData(color: AppColors.cTextOnPrimary),
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.cShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0.r)),
        ),
      ),

      // ── Bottom Navigation ─────────────────────
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cSurface,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cTextHint,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.cSurface,
        indicatorColor: AppColors.cPrimary100,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.cPrimary, size: 24);
          }
          return const IconThemeData(color: AppColors.cTextHint, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall(color: AppColors.cPrimary);
          }
          return AppTextStyles.labelSmall(color: AppColors.cTextHint);
        }),
        elevation: 8,
        height: 64,
      ),

      // ── Drawer ───────────────────────────────
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.cBackground,
        width: 300,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
        ),
      ),

      // ── Cards ────────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.cCardBg,
        elevation: 2,
        shadowColor: AppColors.cShadow,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.cDivider, width: 0.8),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ── Elevated Button ───────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.cPrimary,
          foregroundColor: AppColors.cTextOnPrimary,
          disabledBackgroundColor: AppColors.cPrimary200,
          elevation: 2,
          shadowColor: AppColors.cShadow,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          textStyle: AppTextStyles.button(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── Outlined Button ───────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.cPrimary,
          side: const BorderSide(color: AppColors.cPrimary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          textStyle: AppTextStyles.button(color: AppColors.cPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── Text Button ───────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.cPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          textStyle: AppTextStyles.button(color: AppColors.cPrimary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // ── FAB ───────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.cSecondary,
        foregroundColor: AppColors.cTextOnSecondary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ── Input / Text Fields ───────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cSurfaceVariant,
        hintStyle: AppTextStyles.bodyMedium(color: AppColors.cTextHint),
        labelStyle: AppTextStyles.bodyMedium(color: AppColors.cTextSecondary),
        floatingLabelStyle: AppTextStyles.labelMedium(
          color: AppColors.cPrimary,
        ),
        prefixIconColor: AppColors.cTextHint,
        suffixIconColor: AppColors.cTextHint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cBorderFocus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cError, width: 2),
        ),
      ),

      // ── Chips ────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.cPrimary50,
        selectedColor: AppColors.cPrimary,
        secondarySelectedColor: AppColors.cPrimary,
        labelStyle: AppTextStyles.labelMedium(),
        secondaryLabelStyle: AppTextStyles.labelMedium(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.cPrimary200),
        ),
      ),

      // ── Dialogs ───────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cSurface,
        elevation: 24,
        shadowColor: AppColors.cShadow,
        titleTextStyle: AppTextStyles.headlineSmall(),
        contentTextStyle: AppTextStyles.bodyMedium(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      // ── Bottom Sheet ──────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.cSurface,
        modalBackgroundColor: AppColors.cSurface,
        elevation: 8,
        modalElevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ── List Tile ─────────────────────────────
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        titleTextStyle: AppTextStyles.titleMedium(),
        subtitleTextStyle: AppTextStyles.bodySmall(),
        leadingAndTrailingTextStyle: AppTextStyles.labelMedium(),
        iconColor: AppColors.cPrimary,
        tileColor: Colors.transparent,
        selectedColor: AppColors.cPrimary,
        selectedTileColor: AppColors.cPrimary50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // ── Tabs ─────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.cPrimary,
        unselectedLabelColor: AppColors.cTextHint,
        labelStyle: AppTextStyles.labelLarge(color: AppColors.cPrimary),
        unselectedLabelStyle: AppTextStyles.labelLarge(
          color: AppColors.cTextHint,
        ),
        indicatorColor: AppColors.cPrimary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: AppColors.cDivider,
      ),

      // ── Slider ───────────────────────────────
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.cPrimary,
        inactiveTrackColor: AppColors.cPrimary100,
        thumbColor: AppColors.cPrimary,
        overlayColor: AppColors.cOverlay,
        valueIndicatorColor: AppColors.cPrimary,
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      ),

      // ── Switch ───────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.cTextOnPrimary;
          }
          return AppColors.cTextHint;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.cPrimary;
          return AppColors.cDivider;
        }),
      ),

      // ── Checkbox ─────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.cPrimary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: const BorderSide(color: AppColors.cBorder, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ── Radio ─────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.cPrimary;
          return AppColors.cTextHint;
        }),
      ),

      // ── Progress Indicator ────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.cPrimary,
        linearTrackColor: AppColors.cPrimary100,
        circularTrackColor: AppColors.cPrimary50,
      ),

      // ── Tooltip ──────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.cPrimary900,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTextStyles.caption(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      // ── Divider ──────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.cDivider,
        thickness: 1,
        space: 1,
      ),

      // ── Icon ─────────────────────────────────
      iconTheme: const IconThemeData(color: AppColors.cPrimary, size: 24),

      // ── Badge ────────────────────────────────
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.cSecondary,
        textColor: AppColors.cTextOnSecondary,
      ),
    );
  }

  // ════════════════════════════════════════════
  //  DARK THEME
  // ════════════════════════════════════════════
  // static ThemeData get dark {
  //   final base = ThemeData.dark(useMaterial3: true);

  //   return base.copyWith(
  //     useMaterial3: true,

  //     colorScheme: const ColorScheme(
  //       brightness: Brightness.dark,
  //       primary:              AppColors.cPrimary300,
  //       onPrimary:            AppColors.cPrimary900,
  //       primaryContainer:     AppColors.cPrimary800,
  //       onPrimaryContainer:   AppColors.cPrimary100,
  //       secondary:            AppColors.cSecondary400,
  //       onSecondary:          AppColors.cSecondary900,
  //       secondaryContainer:   AppColors.cSecondary800,
  //       onSecondaryContainer: AppColors.cSecondary100,
  //       tertiary:             AppColors.cTeal,
  //       onTertiary:           AppColors.cDark,
  //       tertiaryContainer:    Color(0xFF004D47),
  //       onTertiaryContainer:  Color(0xFFB2DFDB),
  //       error:                Color(0xFFFFB4AB),
  //       onError:              Color(0xFF690005),
  //       errorContainer:       Color(0xFF93000A),
  //       onErrorContainer:     Color(0xFFFFDAD6),
  //       surface:              AppColors.cDarkSurface,
  //       onSurface:            AppColors.cTextOnDark,
  //       surfaceContainerHighest: AppColors.cDarkCard,
  //       onSurfaceVariant:     Color(0xFFCDC8BA),
  //       outline:              Color(0xFF97917E),
  //       outlineVariant:       Color(0xFF4A4539),
  //       shadow:               Color(0xFF000000),
  //       scrim:                Color(0xFF000000),
  //       inverseSurface:       AppColors.cParchment,
  //       onInverseSurface:     AppColors.cPrimary900,
  //       inversePrimary:       AppColors.cPrimary600,
  //     ),

  //     scaffoldBackgroundColor: AppColors.cDark,

  //     textTheme: _buildTextTheme(Brightness.dark),

  //     appBarTheme: AppBarTheme(
  //       backgroundColor:  AppColors.cDarkSurface,
  //       foregroundColor:  AppColors.cTextOnDark,
  //       elevation:        0,
  //       centerTitle:      true,
  //       titleTextStyle:   AppTextStyles.titleLarge(color: AppColors.cTextOnDark),
  //       iconTheme: const IconThemeData(color: AppColors.cTextOnDark),
  //       surfaceTintColor: Colors.transparent,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
  //       ),
  //     ),

  //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //       backgroundColor:      AppColors.cDarkSurface,
  //       selectedItemColor:    AppColors.cPrimary300,
  //       unselectedItemColor:  Color(0xFF8A8072),
  //       type:                 BottomNavigationBarType.fixed,
  //       elevation:            8,
  //     ),

  //     cardTheme: CardTheme(
  //       color:       AppColors.cDarkCard,
  //       elevation:   4,
  //       shadowColor: Colors.black38,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //         side: const BorderSide(color: Color(0xFF2E3D30), width: 0.8),
  //       ),
  //       clipBehavior: Clip.antiAlias,
  //     ),

  //     inputDecorationTheme: InputDecorationTheme(
  //       filled:     true,
  //       fillColor:  AppColors.cDarkCard,
  //       hintStyle:  AppTextStyles.bodyMedium(color: const Color(0xFF8A8072)),
  //       labelStyle: AppTextStyles.bodyMedium(color: const Color(0xFFCDC8BA)),
  //       floatingLabelStyle: AppTextStyles.labelMedium(color: AppColors.cPrimary300),
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(color: Color(0xFF4A4539)),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(color: Color(0xFF4A4539)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: const BorderSide(color: AppColors.cPrimary300, width: 2),
  //       ),
  //     ),

  //     dividerTheme: const DividerThemeData(
  //       color:     Color(0xFF2E3D30),
  //       thickness: 1,
  //       space:     1,
  //     ),

  //     iconTheme: const IconThemeData(
  //       color: AppColors.cPrimary300,
  //       size:  24,
  //     ),
  //   );
  // }

  // ─────────────────────────────────────────────
  //  SHARED TEXT THEME BUILDER
  // ─────────────────────────────────────────────
  static TextTheme _buildTextTheme() {
    final primaryText = AppColors.cTextPrimary;
    final secondaryText = AppColors.cTextSecondary;
    final hintText = AppColors.cTextHint;

    return TextTheme(
      displayLarge: AppTextStyles.displayLarge(color: primaryText),
      displayMedium: AppTextStyles.displayMedium(color: primaryText),
      displaySmall: AppTextStyles.displaySmall(color: primaryText),
      headlineLarge: AppTextStyles.headlineLarge(color: primaryText),
      headlineMedium: AppTextStyles.headlineMedium(color: primaryText),
      headlineSmall: AppTextStyles.headlineSmall(color: primaryText),
      titleLarge: AppTextStyles.titleLarge(color: primaryText),
      titleMedium: AppTextStyles.titleMedium(color: primaryText),
      titleSmall: AppTextStyles.titleSmall(color: primaryText),
      bodyLarge: AppTextStyles.bodyLarge(color: primaryText),
      bodyMedium: AppTextStyles.bodyMedium(color: secondaryText),
      bodySmall: AppTextStyles.bodySmall(color: hintText),
      labelLarge: AppTextStyles.labelLarge(color: primaryText),
      labelMedium: AppTextStyles.labelMedium(color: secondaryText),
      labelSmall: AppTextStyles.labelSmall(color: hintText),
    );
  }
}
