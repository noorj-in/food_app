import 'package:food_app/routing/routes.dart';
import 'package:food_app/utils/app.dart';
import 'package:food_app/views/cart_view.dart';
import 'package:food_app/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  static final GoRouter router = GoRouter(
    navigatorKey: AppContext.navigatorState,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.dashboard,
        builder: (_, __) {
          return DashboardView();
        },
      ),
      GoRoute(
        path: Routes.cart,
        builder: (_, __) {
          return CartView();
        },
      ),
    ],
  );
}
