import 'package:flutter/material.dart';

class PointsScreen extends StatefulWidget{
  @override
  _PointsScreenState createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
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