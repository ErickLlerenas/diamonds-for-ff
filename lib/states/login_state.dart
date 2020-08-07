import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  bool isLoggedIn = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  login() async {
    try {
      await googleSignIn.signIn();
      isLoggedIn = true;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  logout() {
    googleSignIn.signOut();
    isLoggedIn = false;
    notifyListeners();
  }
}
