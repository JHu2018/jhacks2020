import 'package:flutter/material.dart';
import 'population.dart';

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
        title: const Text('Logistic Map'),
        actions: <Widget>[
          RaisedButton(
              onPressed: () {
                print("HEFFDS");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new InfoPage()));
              },
              child: Text("Info")),
        ],
      ),
      body: Center(
        child: PopulationSimulation(),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InfoPage"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          Text("x\u2099\u208A\u2081 = rx\u2099(1-x\u2099)", style: TextStyle(fontSize: 30)), 
          Text("HELLO"), 
          Text("HELLO")],
      ),
    );
  }
}
