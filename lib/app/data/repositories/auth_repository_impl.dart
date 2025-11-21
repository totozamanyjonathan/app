import 'package:app/app/data/datasources/auth_local_data_source.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> login(String username, String password) async {
    final user = await remoteDataSource.login(username, password);
    await localDataSource.saveUser(user);
    return user;
  }

  @override
  Future<bool> get isAuthenticated async {
    final user = await localDataSource.getUser();
    return user != null;
  }

  @override
  Future<User?> get currentUser => localDataSource.getUser();

  @override
  Future<void> logout() async {
    await localDataSource.clearUser();
  }
}
