import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/dependency/dependency_injection.dart';
import 'package:manzil/core/routes/app_routes.dart';
import 'package:manzil/core/themes/app_theme.dart';
import 'package:manzil/core/themes/bloc/theme_bloc.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

class ManzilApp extends StatelessWidget {
  const ManzilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => sl<ThemeBloc>()..add(const ThemeInitialized()),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => sl<HomeBloc>()..add(const HomeInitialized()),
        ),
      ],
      // Only rebuild MaterialApp when themeMode changes
      child: BlocSelector<ThemeBloc, ThemeState, ThemeMode>(
        selector: (state) => state.themeMode,
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
