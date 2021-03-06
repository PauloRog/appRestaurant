import 'package:app_restaurant_test/store/connection.store.dart';
import 'package:app_restaurant_test/view/pages/splash.screen.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    ConnectionStore store = ConnectionStore();
    store.getConnection();
    return Observer(builder: (context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Restaurant Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: (store.connection == ConnectivityResult.none)
              ? CheckConnection()
              : SplashScreen());
    });
  }
}

class CheckConnection extends StatelessWidget {
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
    );
  }
}
