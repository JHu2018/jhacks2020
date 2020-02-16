import 'package:flutter/material.dart';
import 'package:flutter/animation.dart'; 
import 'package:quiver/async.dart';

class PopulationSimulation extends StatefulWidget {
  @override
  PopulationSimulationState createState() => PopulationSimulationState();
}

class PopulationSimulationState extends State<PopulationSimulation> {
  final List<double> progress = <double>[0.20, 0.201, 0.209, 0.20, 0.20, 0.206, 0.208];
  double r = 3.7;

  bool _isRunning = false;

  void startTimer() {
    final int interval = 100;
    final int iterations = 10;

    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(milliseconds: iterations * interval),
      new Duration(milliseconds: interval),
    );

    setState(() {
      _isRunning = true;
    });

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        for (var i = 0; i < progress.length; i++) {
          progress[i] = r * progress[i] * (1 - progress[i]);
        }
      });
    });

    sub.onDone(() {
      setState(() {
        _isRunning = false;
      });
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PopulationBars(progress),
        Text('$_isRunning'),
        RaisedButton(
          onPressed: () {
            if(!_isRunning) startTimer();
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
            child: LinearProgressIndicator(
              value: this._progress[i].toDouble(),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green[300]),
              backgroundColor: Colors.grey[300],
            ),
          );
        },
      ),
    );
  }
}

class PopulationControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}
