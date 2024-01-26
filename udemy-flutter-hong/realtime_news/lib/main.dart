import 'package:flutter/material.dart';

import 'screen/main_screen.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daliy News',
      routes: {
        '/': (context) => SplashScreen(),
        "/main": (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
