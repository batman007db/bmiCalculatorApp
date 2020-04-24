
import 'package:flutter/material.dart';
import './inputpage.dart';


void main() => runApp(MyApp());
var globalContext;
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    globalContext=context;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        
      
      ),
      home: InputPage(),
    );
  }
}

