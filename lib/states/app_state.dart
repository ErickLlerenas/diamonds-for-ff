import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppState with ChangeNotifier {
  int points = 0;
  bool isLoggedIn = false;
  bool reviewed5Star;
  int dailyReward;
  bool dailyRewardBtn = false;

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
      updateDailyReward();
      notifyListeners();
    } catch (err) {
      login();
    }
  }

  logout() {
    googleSignIn.signOut();
    isLoggedIn = false;
    notifyListeners();
  }

  listener(AppLovinAdListener event, bool isInter) {
    if (event == AppLovinAdListener.adReceived) {
      AppLovin.showInterstitial(interstitial: isInter);
    }
  }

  initValuesFireStore() {
    //Checks if the user has been registered before, if not creates an instance
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      if (!doc.exists) {
        Firestore.instance
            .collection('users')
            .document(googleSignIn.currentUser.email)
            .setData({
          'points': 0,
          'reviewed5Star': false,
          'dailyReward': false,
          'playerID': null
        });
      }
    });
  }

  _addPoints(int pointsAdded) {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      points = doc.data['points'];
      points += pointsAdded;
      Firestore.instance
          .collection('users')
          .document(googleSignIn.currentUser.email)
          .updateData({'points': points});
      notifyListeners();
    });
  }

  requestInterstitial() {
    AppLovin.requestInterstitial((AppLovinAdListener event) {
      listener(event, true);
      if (event == AppLovinAdListener.adHidden) {
        _addPoints(10);
      }
    }, interstitial: true);
  }

  reclaimDailyReward() {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      dailyReward = doc.data['dailyReward'];
      if (DateTime.now().day != dailyReward) {
        Firestore.instance
            .collection('users')
            .document(googleSignIn.currentUser.email)
            .updateData({'dailyReward': DateTime.now().day});
        _addPoints(25);
        dailyRewardBtn = false;
      }
    });
  }

  updateDailyReward() {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      dailyReward = doc.data['dailyReward'];
      if (int.parse(DateTime.now().day.toString()) != dailyReward) {
        dailyRewardBtn = true;
      } else {
        dailyRewardBtn = false;
      }
      notifyListeners();
    });
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
                    Firestore.instance
                        .collection('users')
                        .document(googleSignIn.currentUser.email)
                        .get()
                        .then((doc) {
                      points = doc.data['points'];
                    });
                    Navigator.pop(context);
                    if (points >= cost) {
                      confirmDiamonds(context,
                          cost: cost,
                          diamonds: diamonds,
                          playerID: _controller.text);
                    } else {
                      insufficientPoints(context);
                    }
                    notifyListeners();
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

  insufficientPoints(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Puntos Insuficientes"),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No tienes los puntos necesarios para esta opción"),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text("Crerrar"),
                  )
                ])
              ],
            ),
          ),
        );
      },
    );
  }

  confirmDiamonds(context, {String playerID, int diamonds, int cost}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar Canjeo"),
          content: Text("¿Quieres canjear $cost por $diamonds diamantes?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Firestore.instance
                    .collection('users')
                    .document(googleSignIn.currentUser.email)
                    .updateData({
                  'playerID': _controller.text,
                  'diamonds': diamonds,
                  'points': (points - cost)
                });
              },
              child: Text("Confirmar"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        );
      },
    );
  }
}
