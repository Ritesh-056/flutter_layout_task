import 'package:flutter/material.dart';

void main() {
  runApp(AppStarterScreen());
}

class AppStarterScreen extends StatelessWidget {
  const AppStarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}
