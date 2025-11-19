import 'package:app/app/views/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ).copyWith(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/OIP.webp"),
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
                vertical: 15.0,
              ).copyWith(top: 25.0),
              child: Text("Everything start from here."),
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
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
              onPressed: () {},
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
