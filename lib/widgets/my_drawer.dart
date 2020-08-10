import 'package:diamonds_for_ff/screens/how_it_works.dart';
import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: Text(
              appState.googleSignIn.currentUser.displayName,
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(appState.googleSignIn.currentUser.email,
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:
                    NetworkImage(appState.googleSignIn.currentUser.photoUrl)),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.solidStar,
              color: Colors.yellow[700],
              size: 28,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              'Califica nuestra app',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            onTap: () {
              Navigator.pop(context);
              appState.show5StarReviewDialog(context);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.infoCircle,
              color: Colors.blueGrey,
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
              FontAwesomeIcons.checkCircle,
              color: Colors.teal,
              size: 28,
            ),
            trailing: Icon(Icons.navigate_next),
            title: Text(
              'Política de privacidad',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            onTap: () async {
              appState.launchURL(
                  "https://erickllerenas.github.io/diamantes-free-fire-policy/");
              Navigator.pop(context);
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
              Navigator.pop(context);
              appState.logout();
            },
          ),
        ],
      ),
    );
  }
}
