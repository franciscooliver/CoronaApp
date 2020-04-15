import 'package:corona_app/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona App',
      theme: ThemeData(
        fontFamily: 'Google Roboto',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}