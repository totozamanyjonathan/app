import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthController {
  final LoginUseCase loginUseCase;

  AuthController(this.loginUseCase);

  Future<User> login({
    required String username,
    required String password,
  }) async {
    try {
      return await loginUseCase(username, password);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
