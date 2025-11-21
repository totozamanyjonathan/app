import 'package:auto_route/auto_route.dart';
import 'package:app/app/presentation/routes/app_router.gr.dart';
import 'package:app/app/data/datasources/auth_local_data_source.dart';
import 'package:app/app/data/datasources/auth_remote_data_source.dart';
import 'package:app/app/data/repositories/auth_repository_impl.dart';
import 'package:app/app/domain/usecases/login_usecase.dart';
import 'package:app/app/presentation/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    final authRemoteDataSource = AuthRemoteDataSource();
    final authLocalDataSource = AuthLocalDataSource();
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
      localDataSource: authLocalDataSource,
    );
    final loginUseCase = LoginUseCase(authRepository);
    authController = AuthController(loginUseCase);
  }

  Future<void> login(String username, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      final user = await authController.login(
        username: username,
        password: password,
      );
      if (mounted) {
        context.router.replace(WelcomeRoute(user: user));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid credentials"),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: (!isLoading)
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please login to your account",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Spacer(),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                    ),
                    FilledButton(
                      onPressed: () => login(
                        usernameController.text,
                        passwordController.text,
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Login"),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(width: 8.0),
                        InkWell(
                          onTap: () {
                            context.router.replace(const RegisterRoute());
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 10.0,
                children: [
                  CircularProgressIndicator(),
                  Text("Logging in, please wait..."),
                ],
              ),
            ),
    );
  }
}

/* 
  (condition) ? si vrai : si faux;
  
  InkWell();
  GestureDetector();
 */
