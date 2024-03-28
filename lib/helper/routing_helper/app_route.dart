import 'package:auto_route/auto_route.dart';
import 'package:nextdoorgym/helper/routing_helper/app_route.gr.dart';
import 'package:nextdoorgym/helper/routing_helper/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [],
        ),
        //
      ];
}
