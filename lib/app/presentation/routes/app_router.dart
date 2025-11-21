import 'package:auto_route/auto_route.dart';
import 'package:app/app/presentation/routes/auth_guard.dart';
import 'package:app/app/presentation/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true, guards: [authGuard]),
    AutoRoute(page: LoginRoute.page, guards: [authGuard]),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: PostRoute.page),
  ];
}
