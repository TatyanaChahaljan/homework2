import 'package:cats/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter cats',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway-Regular'
      ),
      home: const MyHomePage(title: 'It was going to be a lonely trip back.'),
    );
  }
}

