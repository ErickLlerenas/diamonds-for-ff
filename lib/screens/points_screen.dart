import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PointsScreen extends StatefulWidget {
  @override
  _PointsScreenState createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance.collection('users').document('${appState.googleSignIn.currentUser.email}').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${snapshot.data['points']}",
                        style:
                            TextStyle(fontSize: 100, color: Colors.grey[700])),
                    Text("Puntos",
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]))
                  ],
                ),
              );
            }));
  }
}
