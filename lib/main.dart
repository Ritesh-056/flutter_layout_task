import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_task/data/bloc/layout_config/layout_bloc.dart';
import 'package:flutter_layout_task/presentation/screens/home_screen.dart';

void main() {
  runApp(AppStarterScreen());
}

class AppStarterScreen extends StatelessWidget {
  const AppStarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Layout Renderer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LayoutBloc(),
        child: LayoutScreen(),
      ),
    );
  }
}
