import 'package:flutter/material.dart';

class PopulationSimulation extends StatefulWidget {
  @override
  PopulationSimulationState createState() => PopulationSimulationState();
}

class PopulationSimulationState extends State<PopulationSimulation> {
  final List<double> progress = <double>[0.2, 0.61, 0.59];
  double r = 2.4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PopulationBars(progress),
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

class PopulationBars extends StatelessWidget {
  final List<double> _progress;

  PopulationBars(this._progress);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: this._progress.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: LinearProgressIndicator(value: this._progress[i].toDouble()),
          );
        },
      ),
    );
  }
}

class PopulationControl extends StatelessWidget {

  @override
  Widget build(BuildContext context){
  }
}