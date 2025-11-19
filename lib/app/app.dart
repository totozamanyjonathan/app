import 'package:app/app/views/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technologia',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
