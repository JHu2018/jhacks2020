import 'package:flutter/material.dart';
import 'population.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Logistic Map Simulator',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Logistic Map Simulator'),
          ),
          body: Center(
            child: PopulationSimulation(),
          ),
        ));
  }
}