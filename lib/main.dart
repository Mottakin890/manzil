import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/app.dart';
import 'package:manzil/core/dependency/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── System UI ──────────────────────────────
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // ── Dependency Injection ───────────────────
  await DependencyInjection.init();

  // ── Orientation Lock ───────────────────────
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ManzilApp(),
    ),
  );
}
