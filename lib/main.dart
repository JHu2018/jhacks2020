import 'package:flutter/material.dart';
import 'population.dart';
import 'info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logistic Map',
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logistic Map Simulator'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new InfoPage()));
            },
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'Info',
            ),
          ),
        ],
      ),
      body: Center(
        child: PopulationSimulation(),
      ),
    );
  }
}
