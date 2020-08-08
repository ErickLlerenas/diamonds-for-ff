import 'package:diamonds_for_ff/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AdwardsScreen extends StatefulWidget {
  @override
  _AdwardsScreenState createState() => _AdwardsScreenState();
}

class _AdwardsScreenState extends State<AdwardsScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Canjea Diamantes",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text("Escoge uno de nuestros premios",
                  style: TextStyle(color: Colors.grey[700])),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      appState.showBuyDiamondsDialog(context,
                          diamonds: 110, cost: 19000);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Card(
                          color: Colors.brown,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '110',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.brown[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              FaIcon(
                                FontAwesomeIcons.gem,
                                size: 60,
                                color: Colors.brown[900],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('19,000',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.brown[900])),
                              Text(
                                'Puntos',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.brown[900],
                                ),
                              )
                            ],
                          )),
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: MediaQuery.of(context).size.width / 1.7,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appState.showBuyDiamondsDialog(context,
                          diamonds: 341, cost: 59000);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Card(
                          color: Colors.blueGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '341',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              FaIcon(
                                FontAwesomeIcons.gem,
                                size: 60,
                                color: Colors.blueGrey[900],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('59,000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey[900])),
                              Text(
                                'Puntos',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey[900],
                                ),
                              )
                            ],
                          )),
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: MediaQuery.of(context).size.width / 1.7,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appState.showBuyDiamondsDialog(context,
                          diamonds: 572, cost: 99000);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Card(
                          color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '572',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.yellow[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              FaIcon(
                                FontAwesomeIcons.gem,
                                size: 60,
                                color: Colors.yellow[900],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('99,000',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.yellow[900])),
                              Text(
                                'Puntos',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.yellow[900],
                                ),
                              )
                            ],
                          )),
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: MediaQuery.of(context).size.width / 1.7,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appState.showBuyDiamondsDialog(context,
                          diamonds: 420,
                          cost: 39000,
                          info:
                              '¡Reclama 60 diamantes en juego cada día durante 7 días! ¡Recibirás 420 diamantes en total!');
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Card(
                          color: Colors.lightBlue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '420',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.lightBlue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              FaIcon(
                                FontAwesomeIcons.gem,
                                size: 60,
                                color: Colors.lightBlue[900],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Tarjeta Semanal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.lightBlue[900])),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('39,000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlue[900])),
                              Text(
                                'Puntos',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.lightBlue[900],
                                ),
                              )
                            ],
                          )),
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: MediaQuery.of(context).size.width / 1.7,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
