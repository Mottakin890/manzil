import 'package:flutter/material.dart';
import 'package:manzil/core/routes/app_routes.dart';
import 'package:manzil/core/themes/app_theme.dart';

class ManzilApp extends StatelessWidget {
  const ManzilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
    );
  }
}
