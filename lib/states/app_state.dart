import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:adcolony/adcolony.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class AppState with ChangeNotifier {
  int points = 0;
  bool isLoggedIn = false;
  int dailyReward;
  bool dailyRewardBtn = false;
  bool loading = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AppState() {
    AdColony.init(AdColonyOptions(
        'app079c7330bbf04c0cb0', '0', ['vze61101d6b0b34ebf96']));
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

  void _listener(AdColonyAdListener event) {
    if (event == AdColonyAdListener.onRequestFilled) AdColony.show();
    if (event == AdColonyAdListener.onClosed) _addPoints(10);
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
    AdColony.request('vze61101d6b0b34ebf96', _listener);
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
        if (int.parse(DateTime.now().day.toString()) != dailyReward) {
          dailyRewardBtn = true;
        } else {
          dailyRewardBtn = false;
        }
      }
      notifyListeners();
    });
  }

  void _buyDiamonds(context, int diamonds, int cost, String playerID) async {
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
            height: info != null ? 190 : 145,
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingresa tu ID de jugador.';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'ID de jugador'),
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
                          if (_formKey.currentState.validate()) {
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
                                    playerID: _controller.text,
                                    info: info);
                              } else {
                                _showInsufficientPointsDialog(context);
                              }
                            });
                            notifyListeners();
                          }
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
      {String playerID, int diamonds, int cost, String info}) {
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
                  info == null
                      ? Text(
                          "¿Quieres canjear $cost puntos por $diamonds diamantes? Tus diamantes llegarán en unas horas.",
                          style: TextStyle(color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "$info",
                          style: TextStyle(color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _buyDiamonds(context, diamonds, cost, playerID);
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
          title: Text("Califica la app",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.bold)),
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text(
                  "¿Te gusta la Aplicación? Danos una reseña",
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
