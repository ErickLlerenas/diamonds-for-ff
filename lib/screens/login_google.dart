import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInGoogle extends StatefulWidget {
  @override
  _LogInGoogleState createState() => _LogInGoogleState();
}

class _LogInGoogleState extends State<LogInGoogle> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Inicia Sesión",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700])),
          Text(
            "¡Gana diamantes para Free Fire!",
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            FontAwesomeIcons.gem,
            color: Colors.lightBlue,
            size: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: checked,
                onChanged: (bool value) {
                  setState(() {
                    checked = value;
                  });
                },
              ),
              Text('He leído y acepto la '),
              InkWell(
                  onTap: () => appState.launchURL(
                      "https://erickllerenas.github.io/diamantes-free-fire-policy/"),
                  child: Text(
                    "política de privacidad",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
          GoogleSignInButton(
            onPressed: () {
              if (checked) {
                appState.login();
              } else {
                Fluttertoast.showToast(
                    msg: "Debes aceptar la política de privacidad",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            splashColor: Colors.white,
            // setting splashColor to Colors.transparent will remove button ripple effect.
          ),
        ],
      )),
    );
  }
}
