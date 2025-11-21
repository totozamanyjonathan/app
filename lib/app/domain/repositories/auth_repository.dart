import 'package:app/app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<bool> get isAuthenticated;
  Future<User?> get currentUser;
  Future<void> logout();
}
