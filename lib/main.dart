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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var progress = [0.8, 0.1, 0.5];

    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < progress.length) {
            return Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: LinearProgressIndicator(value: progress[i].toDouble()),
            );
          }
        });
  }
}
