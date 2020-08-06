import 'package:flutter/material.dart';
import 'package:applovin/applovin.dart';

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
      body:  Center(
          child: RaisedButton(
        onPressed: () => AppLovin.requestInterstitial(
            (AppLovinAdListener event) => listener(event, true),
            interstitial: true),
        child: Text('Ver video'),
      )),
    );
  }
}
