import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("0",style: TextStyle(fontSize: 100,color: Colors.grey[700])),
          Text("Puntos",style: TextStyle(fontSize: 20,color: Colors.grey[700]))
        ],
      ),
      )
    );
  }
}