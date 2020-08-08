import 'package:diamonds_for_ff/screens/home.dart';
import 'package:diamonds_for_ff/screens/login_google.dart';
import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[50],
      systemNavigationBarColor: Colors.grey[50],
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
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
    final appState = Provider.of<AppState>(context);
    return MaterialApp(
        theme: new ThemeData(
            primarySwatch: Colors.grey,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: appState.isLoggedIn ? Home() : LogInGoogle());
  }
}
