import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppState with ChangeNotifier {
  int points = 0;
  bool isLoggedIn = false;
  String playerID;
  bool reviewed5Star;
  bool dailyReward;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final _controller = TextEditingController();

  AppState() {
    AppLovin.init();
  }

  login() async {
    try {
      await googleSignIn.signIn();
      isLoggedIn = true;
      initValuesFireStore();
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

  listener(AppLovinAdListener event, bool isInter) {
    print(event);
    if (event == AppLovinAdListener.adReceived) {
      AppLovin.showInterstitial(interstitial: isInter);
    }
  }

  initValuesFireStore() {
    //Checks if the user has been registered before, if not creates an instance
    print(Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      if (!doc.exists) {
        Firestore.instance
            .collection('users')
            .document(googleSignIn.currentUser.email)
            .setData({'points':0,'reviewed5Star':false,'dailyReward':false,'playerID':null});
      }
    }));
  }

  requestInterstitial() {
    AppLovin.requestInterstitial((AppLovinAdListener event) {
      listener(event, true);
      if (event == AppLovinAdListener.adHidden) {
         Firestore.instance
            .collection('users')
            .document(googleSignIn.currentUser.email).get().then((doc){
              
            });
        points += 10;
        Firestore.instance
            .collection('users')
            .document(googleSignIn.currentUser.email)
            .updateData({'points': 1200});
      }
    }, interstitial: true);
  }

  void showBuyDiamondsDialog(context, {int diamonds, int cost, String info}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "$diamonds Diamantes",
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: info != null ? 175 : 120,
            child: Column(
              children: <Widget>[
                Form(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration:
                        InputDecoration(hintText: 'Ingresa tu ID de jugador'),
                    controller: _controller,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                info != null
                    ? Text(
                        '$info',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                FlatButton(
                  onPressed: () {
                    print(_controller.text);
                  },
                  child: Text("Canjear por $cost puntos"),
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
}
