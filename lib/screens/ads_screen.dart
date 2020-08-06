import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsScreen extends StatefulWidget {
  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    AppLovin.init();
    super.initState();
  }

  listener(AppLovinAdListener event, bool isInter) {
    print(event);
    if (event == AppLovinAdListener.adReceived) {
      AppLovin.showInterstitial(interstitial: isInter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: SvgPicture.asset('assets/invest.svg')),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.yellow[600],
                  onPressed: () {},
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+25',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Recoger Recompensa Diaria',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 120,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () => AppLovin.requestInterstitial(
                      (AppLovinAdListener event) => listener(event, true),
                      interstitial: true),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+10',
                        style: TextStyle(fontSize: 38),
                      ),
                      Text(
                        'Ganar Puntos',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
