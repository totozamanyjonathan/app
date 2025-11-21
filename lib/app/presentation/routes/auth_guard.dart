import 'package:auto_route/auto_route.dart';
import 'package:app/app/domain/repositories/auth_repository.dart';
import 'package:app/app/presentation/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthRepository authRepository;

  AuthGuard(this.authRepository);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = await authRepository.isAuthenticated;
    if (isAuthenticated) {
      final user = await authRepository.currentUser;
      if (user != null) {
        // ignore: deprecated_member_use
        resolver.redirect(WelcomeRoute(user: user));
      } else {
        resolver.next(true);
      }
    } else {
      resolver.next(true);
    }
  }
}
