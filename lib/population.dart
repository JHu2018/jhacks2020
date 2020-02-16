import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:quiver/async.dart';
import 'package:intl/intl.dart';

class PopulationSimulation extends StatefulWidget {
  @override
  _PopulationSimulationState createState() => _PopulationSimulationState();
}

/// Population simulator
class _PopulationSimulationState extends State<PopulationSimulation> {
  final List<List<double>> _progressLog = <List<double>>[[]];
  double _r = 3.8;
  bool _isRunning = false;
  int _currIdx = 0;
  final int _iterations = 20;
  bool _isRunOnce = false;

  void initState() {
    super.initState();
    buildStartProgress(0);
  }

  void buildStartProgress(x) {
    final gen = Random();
    final List<double> currProgress = <double>[];

    for (var i = 0; i < 10; i++) {
      currProgress.add(x + gen.nextDouble() * 0.01);
    }

    _progressLog.clear();
    _progressLog.add(currProgress);
  }

  void startTimer() {
    final int interval = 100;

    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(milliseconds: _iterations * interval),
      new Duration(milliseconds: interval),
    );

    setState(() {
      _isRunning = true;
      buildStartProgress(0.7);
      _currIdx = 0;
    });

    final sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        var prevProgress = _progressLog[_progressLog.length - 1];
        var currProgress = <double>[];
        for (var i = 0; i < prevProgress.length; i++) {
          currProgress.add(_r * prevProgress[i] * (1 - prevProgress[i]));
        }
        _progressLog.add(currProgress);
        _currIdx++;
      });
    });

    sub.onDone(() {
      setState(() {
        _isRunning = false;
        _isRunOnce = true;
      });
      sub.cancel();
    });
  }

  Widget renderControl() {
    if (!_isRunning) {
      return Column(
        children: <Widget>[
          _isRunOnce
              ? Row(
                  children: <Widget>[
                    const Text('Playback:'),
                    Expanded(
                      child: Slider(
                        value: _currIdx / _iterations,
                        onChanged: (x) {
                          setState(() {
                            _currIdx = (x * _iterations).round();
                          });
                        },
                      ),
                    )
                  ],
                )
              : Container(),
          RaisedButton(
            onPressed: () {
              if (!_isRunning) startTimer();
            },
            child: const Text('Run Simulation'),
          ),
          Container(
          margin: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("r:", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 150.0,
                  maxHeight: 50.0,
                  minWidth: 150.0,
                  minHeight: 50.0,
                ),
                child: TextFormField(
                  autovalidate: true,
                  initialValue: "0.0",
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (String value){
                    if (double.tryParse(value) == null){
                      return "r must be a double";
                    }else if (double.parse(value) <= 4 && double.parse(value) >= 0){
                      return null;
                    }else {
                      return "r \u2208 [0, 4]";
                    }
                  },
                  onSaved: (String value){
                    //todo later
                  },
                ),
              ),
              VerticalDivider(color: Color(0xFFD3D3D3), thickness: 5,),
              Text("x\u2080:", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 150.0,
                  maxHeight: 50.0,
                  minWidth: 150.0,
                  minHeight: 50.0,
                ),
                child: TextFormField(
                  autovalidate: true,
                  initialValue: "0",
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (String value){
                    if (double.tryParse(value) == null){
                      return "r must be a double";
                    }else if (double.parse(value) <= 1 && double.parse(value) >= 0){
                      return null;
                    }else {
                      return "r \u2208 [0, 1]";
                    }
                  },
                  onSaved: (String value){
                    //todo later
                  },
                ),
              ),
            ],
          ),
        ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _PopulationBars(_progressLog[_currIdx]),
          renderControl(),
        ],
      ),
    );
  }
}

/// Renders population bars
class _PopulationBars extends StatelessWidget {
  final List<double> _progress;

  _PopulationBars(this._progress);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: this._progress.length,
        itemBuilder: (context, i) {

          final formatter = NumberFormat('00%');

          return Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: Text(formatter.format(this._progress[i])),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: this._progress[i].toDouble(),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.green[300]),
                    backgroundColor: Colors.grey[300],
                  ),
                )
              ],
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
