import 'package:auto_route/auto_route.dart';
import 'package:app/app/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/OIP.webp",
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              "Let's\nget started!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 64.0,
                height: 0.9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50.0,
              ).copyWith(top: 25.0),
              child: Text("Everything start from here."),
            ),
            FilledButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 10.0),
            FilledButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xDD3A3A3A),
                foregroundColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
