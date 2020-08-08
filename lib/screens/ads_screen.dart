import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Gana monedas",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold,fontSize: 30),),
              Text("Mira anuncios y empieza a ganar",style: TextStyle(color:Colors.grey[700]),),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset('assets/money.jpg')),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 70,
                child: FlatButton(
                  textColor: Colors.white,
                  onPressed: (){},
                  color: Colors.yellow[600],
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+25',
                        style:TextStyle(fontSize: 24,color: Colors.yellow[900],fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Recompensa diaria',
                        style: TextStyle(fontSize: 18,color: Colors.yellow[900],fontWeight: FontWeight.bold),
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
                  onPressed: () => appState.requestInterstitial(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '+10',
                        style: TextStyle(fontSize: 24,color: Colors.blue[900],fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ganar puntos',
                        style: TextStyle(fontSize: 18,color: Colors.blue[900],fontWeight: FontWeight.bold),
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
