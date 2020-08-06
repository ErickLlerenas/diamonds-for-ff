import 'package:diamonds_for_ff/screens/ads_screen.dart';
import 'package:diamonds_for_ff/screens/awards_screen.dart';
import 'package:diamonds_for_ff/screens/home_screen.dart';
import 'package:diamonds_for_ff/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[50], // navigation bar color
    statusBarColor: Colors.blue, // status bar color
  ));
  return runApp(MyApp());
}

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
            drawer: CustomDrawer(),
            body: _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.ad),
                  title: Text('Ganar'),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.coins),
                  title: Text('Puntos'),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.gem),
                  title: Text('Premios'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              onTap: _onItemTapped,
            )));
  }
}
