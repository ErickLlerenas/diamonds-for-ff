import 'package:diamonds_for_ff/screens/ads_screen.dart';
import 'package:diamonds_for_ff/screens/awards_screen.dart';
import 'package:diamonds_for_ff/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    AdsScreen(),
    HomeScreen(),
    AdwardsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline),
                  title: Text('Anuncios'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Inicio'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  title: Text('Premios'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            )));
  }
}
