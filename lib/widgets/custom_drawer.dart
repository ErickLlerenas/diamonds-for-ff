import 'package:diamonds_for_ff/screens/how_it_works.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ashish Rawat"),
            accountEmail: Text("ashishrawat2911@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.solidStar,
              color: Colors.yellow[700],
              size: 32,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              'Danos 5 Estrellas',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.question,
              color: Colors.blue,
              size: 32,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              '¿Cómo Funciona?',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HowItWorks()),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 32,
            ),
            title: Text(
              'Cerrar Sesión',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
