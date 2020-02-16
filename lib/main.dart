import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Logistic Map',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Logistic Map'),
          ),
          body: Center(
            child: PopulationList(),
          ),
        ));
  }
}

class PopulationList extends StatefulWidget {
  @override
  PopulationListState createState() => PopulationListState();
}

class PopulationListState extends State<PopulationList> {
  final List<double> progress = <double>[0.2, 0.61, 0.59];
  final double r = 2.4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: progress.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: LinearProgressIndicator(value: progress[i].toDouble()),
              );
            },
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              for (var i = 0; i < progress.length; i++) {
                progress[i] = r * progress[i] * (1 - progress[i]);
              }
            });
          },
          child: const Text("Click me"),
        ),
      ],
    );
  }
}
