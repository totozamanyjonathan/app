import 'package:app/app/views/my_home_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technologia',
      home: MyHomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
