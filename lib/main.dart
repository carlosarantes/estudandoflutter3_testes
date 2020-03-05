import 'package:estudando_flutter2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
} 

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
                primaryColor: Colors.green[900],
                accentColor: Colors.blueAccent[700], 
                buttonTheme: ButtonThemeData(
                    buttonColor: Colors.blueAccent[700],
                    textTheme: ButtonTextTheme.primary,
                ),
      ),
      home: Dashboard() /*Dashboard()*/,
    );
  }
}


