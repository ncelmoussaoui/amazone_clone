import 'package:amazone_clone/utils/theme.dart';
import 'package:amazone_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthScreens(),
      theme: theme,
    );
  }
}
