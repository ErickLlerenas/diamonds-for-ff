import 'package:diamonds_for_ff/screens/home.dart';
import 'package:diamonds_for_ff/screens/login_google.dart';
import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:diamonds_for_ff/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: LoginState()),
    ChangeNotifierProvider.value(value: AppState()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return MaterialApp(home: loginState.isLoggedIn ? Home() : LogInGoogle());
  }
}
