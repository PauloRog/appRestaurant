import 'package:app_restaurant_test/view/splash.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Restaurant Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerTheme: DividerThemeData(
          space: 10,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
