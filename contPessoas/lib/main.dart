import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "OwnApp",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _info = "BEM VINDOS pode entrar";

  void _contPeople(int delta) {
    setState(() {
      _people += delta;

      if (_people <= 0) {
        _people = 0;
        _info = "BEM VINDOS pode entrar";
      } else if (_people < 10) {
        _info = "pode entrar";
      } else {
        _info = "lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contador de pessoas"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: [
            Image.asset(
              "images/restaurant.jpg",
              fit: BoxFit.cover,
              height: 1000,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pessoas $_people",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(1.0),
                          child: FlatButton(
                            child: Text(
                              "+1",
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                            onPressed: () {
                              _contPeople(1);
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.all(1.0),
                          child: FlatButton(
                            child: Text(
                              "-1",
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                            onPressed: () {
                              _contPeople(-1);
                            },
                          )),
                    ],
                  ),
                  Text(
                    _info,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
