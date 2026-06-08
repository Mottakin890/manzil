import 'package:go_router/go_router.dart';
import 'package:manzil/core/routes/app_pages.dart';
import 'package:manzil/features/home/presentation/view/home_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppPages.home,
    routes: [
      GoRoute(
        path: AppPages.home,
        name: AppPages.home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
