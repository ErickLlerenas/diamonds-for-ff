import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdwardsScreen extends StatefulWidget {
  @override
  _AdwardsScreenState createState() => _AdwardsScreenState();
}

class _AdwardsScreenState extends State<AdwardsScreen> {
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert Dialog title"),
            content: Form(
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: 'Ingresa tu ID de jugador'),
                controller: _controller,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _showDialog();
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
                    height: MediaQuery.of(context).size.width / 1.4,
                  ),
                ),
                Container(
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
                                  fontSize: 16, color: Colors.blueGrey[900])),
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
                  height: MediaQuery.of(context).size.width / 1.4,
                ),
                Container(
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
                  height: MediaQuery.of(context).size.width / 1.4,
                ),
                Container(
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
                                  fontSize: 16, color: Colors.lightBlue[900])),
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
                  height: MediaQuery.of(context).size.width / 1.4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
