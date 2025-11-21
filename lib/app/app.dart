import 'package:app/app/data/datasources/auth_local_data_source.dart';
import 'package:app/app/data/datasources/auth_remote_data_source.dart';
import 'package:app/app/data/repositories/auth_repository_impl.dart';
import 'package:app/app/presentation/routes/app_router.dart';
import 'package:app/app/presentation/routes/auth_guard.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    final authRemoteDataSource = AuthRemoteDataSource();
    final authLocalDataSource = AuthLocalDataSource();
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
      localDataSource: authLocalDataSource,
    );
    final authGuard = AuthGuard(authRepository);
    _appRouter = AppRouter(authGuard);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Technologia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
