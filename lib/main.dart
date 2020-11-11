import 'package:flutter/material.dart';
import 'package:buka_buku/screens/login.dart';
import 'package:buka_buku/screens/home.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}
