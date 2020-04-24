import 'package:flutter/material.dart';
import './main.dart';
import './inputpage.dart';


class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :Text('BMI CALCULATOR',),),
      body: Column(
        children: <Widget>[
          Text('Your Result',style: TextStyle(color: Colors.white))
        ],
      )
    );
    
  }
}