import 'package:diamonds_for_ff/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LogInGoogle extends StatefulWidget {
  @override
  _LogInGoogleState createState() => _LogInGoogleState();
}

class _LogInGoogleState extends State<LogInGoogle> {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Inicia Sesión",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.grey[700])),
              Text("¡Gana diamantes para Free Fire!",style: TextStyle(color:Colors.grey[600]),)
              ,
              SizedBox(
                height: 20,
              ),
              FaIcon(FontAwesomeIcons.gem,color: Colors.lightBlue,size: 200,),
              SizedBox(
                height: 20,
              ),
              GoogleSignInButton(
        onPressed: () {
              loginState.login();
        },
        splashColor: Colors.white,
        // setting splashColor to Colors.transparent will remove button ripple effect.
      ),
            ],
          )),
    );
  }
}
