import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'HomeScreen.dart';
import 'splash.dart';
import 'package:hello_rectangle/auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    ExpansionTileSample.tag: (context) => ExpansionTileSample(),
    SplashScreen.tag: (context) => SplashScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      // home: SplashScreen(),
      home: AuthLogin(),
      routes: routes,
    );
  }
}


