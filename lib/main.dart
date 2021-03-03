import 'package:flutter/material.dart';

import 'front.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Front(),
      theme:(ThemeData(primaryColor: Colors.indigo)),
    );
  }
}