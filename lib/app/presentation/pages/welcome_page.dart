import 'package:auto_route/auto_route.dart';
import 'package:app/app/domain/entities/user.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  final User user;

  const WelcomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Welcome! ${user.name}")));
  }
}
