import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AdsScreen extends StatefulWidget {
  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: SvgPicture.asset('assets/money.svg')),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 70,
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.yellow[600],
                  onPressed: () => appState.requestInterstitial(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+25',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Recompensa diaria',
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
                height: 70,
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+10',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Ganar puntos',
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
