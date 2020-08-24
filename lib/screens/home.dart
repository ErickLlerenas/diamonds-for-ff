import 'package:flutter/material.dart';
import 'package:diamonds_for_ff/screens/ads_screen.dart';
import 'package:diamonds_for_ff/screens/awards_screen.dart';
import 'package:diamonds_for_ff/screens/points_screen.dart';
import 'package:diamonds_for_ff/widgets/my_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    AdsScreen(),
    PointsScreen(),
    AdwardsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: MyDrawer(),
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
        ));
  }
}
