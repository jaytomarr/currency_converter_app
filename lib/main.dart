import 'package:currency_converter_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Open Exchange App',
        theme: ThemeData(
          fontFamily: 'DMSans',
          primaryColor: Colors.orange.shade900,
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
