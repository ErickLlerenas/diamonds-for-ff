import 'package:diamonds_for_ff/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: OutlineButton(
          child: Text("Login with Google"),
          onPressed: () {
            loginState.login();
          },
        ),
      ),
    );
  }
}
