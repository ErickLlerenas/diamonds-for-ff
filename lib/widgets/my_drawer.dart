import 'package:diamonds_for_ff/screens/how_it_works.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("¡Gana 100 puntos!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold)),
            content: Container(
              height: 120,
              child: Column(
                children: <Widget>[
                  Text(
                    "Danos una reseña de 5 estrellas y recibe 100 puntos.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () async {
                      const url = "https://play.google.com/store/apps/details?id=com.ejele.tracker";
                      if (await canLaunch(url)) launch(url);
                    },
                    child: Text("VA"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ducky Tie"),
            accountEmail: Text("urbanspot@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "D",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.solidStar,
              color: Colors.yellow[700],
              size: 28,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              'Danos 5 estrellas',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            onTap: () {
              Navigator.pop(context);
              _showDialog();
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.question,
              color: Colors.blue,
              size: 28,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              '¿Cómo funciona?',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
              color: Colors.grey[700],
              size: 28,
            ),
            title: Text(
              'Cerrar sesión',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
