import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';

class AppState with ChangeNotifier {
  int points = 0;
  AppState() {
    AppLovin.init();
  }

  listener(AppLovinAdListener event, bool isInter) {
    print(event);
    if (event == AppLovinAdListener.adReceived) {
      AppLovin.showInterstitial(interstitial: isInter);
    }
  }

  requestInterstitial() {
    AppLovin.requestInterstitial((AppLovinAdListener event) {
      listener(event, true);
      print('XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD $event');
      if (event == AppLovinAdListener.adHidden) {
        points += 10;
      }
    }, interstitial: true);
  }

  final _controller = TextEditingController();
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
