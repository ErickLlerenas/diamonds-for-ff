import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class AppState with ChangeNotifier {
  int points = 0;
  bool isLoggedIn = false;
  bool reviewed5Star = false;
  int dailyReward;
  bool dailyRewardBtn = false;
  bool loading = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController _controller = TextEditingController();

  AppState() {
    AppLovin.init();
  }

  Future login() async {
    try {
      await googleSignIn.signIn();
      isLoggedIn = true;
      _initValuesFireStore();
      _updateDailyReward();
      notifyListeners();
    } catch (err) {
      login();
    }
  }

  void logout() {
    googleSignIn.signOut();
    isLoggedIn = false;
    notifyListeners();
  }

  void _listener(AppLovinAdListener event, bool isInter) {
    if (event == AppLovinAdListener.adReceived) {
      AppLovin.showInterstitial(interstitial: isInter);
    }
  }

  void _initValuesFireStore() {
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

  void _addPoints(int pointsAdded) {
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

  void requestInterstitial() {
    AppLovin.requestInterstitial((AppLovinAdListener event) {
      _listener(event, true);
      if (event == AppLovinAdListener.adHidden) {
        _addPoints(10);
      }
    }, interstitial: true);
  }

  void reclaimDailyReward() {
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

  void _updateDailyReward() {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .get()
        .then((doc) {
      if (doc.exists) {
        dailyReward = doc.data['dailyReward'];
        reviewed5Star = doc.data['reviewed5Star'];
        if (int.parse(DateTime.now().day.toString()) != dailyReward) {
          dailyRewardBtn = true;
        } else {
          dailyRewardBtn = false;
        }
      }
      notifyListeners();
    });
  }

  void _buyDiamonds(int diamonds, int cost) {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .updateData({
      'playerID': _controller.text,
      'diamonds': diamonds,
      'points': (points - cost)
    });
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) launch(url);
  }

  void _user5StarReviewed() {
    Firestore.instance
        .collection('users')
        .document(googleSignIn.currentUser.email)
        .updateData({'reviewed5Star': true});
    reviewed5Star = true;
    _addPoints(100);
    notifyListeners();
  }

  void showBuyDiamondsDialog(context, {int diamonds, int cost, String info}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$diamonds Diamantes",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.bold)),
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
                !loading
                    ? FlatButton(
                        onPressed: () {
                          loading = true;
                          Firestore.instance
                              .collection('users')
                              .document(googleSignIn.currentUser.email)
                              .get()
                              .then((doc) {
                            loading = false;
                            points = doc.data['points'];
                            Navigator.pop(context);
                            if (points >= cost) {
                              _showConfirmDiamondsDialog(context,
                                  cost: cost,
                                  diamonds: diamonds,
                                  playerID: _controller.text);
                            } else {
                              _showInsufficientPointsDialog(context);
                            }
                          });
                          notifyListeners();
                        },
                        child: Text("Canjear por $cost puntos"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))
              ],
            ),
          ),
        );
      },
    );
  }

  void _showInsufficientPointsDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Puntos Insuficientes",
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No tienes los puntos necesarios para esta opción. Consigue más puntos viendo anuncios",
                  style: TextStyle(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FlatButton(
                    color: Colors.grey[700],
                    onPressed: () {},
                    child: Text(
                      "Chale",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ])
              ],
            ),
          ),
        );
      },
    );
  }

  void _showConfirmDiamondsDialog(context,
      {String playerID, int diamonds, int cost}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              "ID DE JUGADOR:\n$playerID",
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 140,
              child: Column(
                children: <Widget>[
                  Text(
                    "¿Quieres canjear $cost puntos por $diamonds diamantes? Tus diamantes llegarán en unas horas.",
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      _buyDiamonds(diamonds, cost);
                      Navigator.pop(context);
                    },
                    child: Text("Confirmar"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ));
      },
    );
  }

  void show5StarReviewDialog(context) {
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
            height: 110,
            child: Column(
              children: <Widget>[
                Text(
                  "Danos una reseña de 5 estrellas y recibe 100 puntos.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () async {
                    launchURL(
                        "https://play.google.com/store/apps/details?id=com.ejele.tracker");
                    _user5StarReviewed();
                    Navigator.pop(context);
                  },
                  child: Text("Dar reseña"),
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
