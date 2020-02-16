import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(30),
          children: <Widget>[
            Text(
              "Background\n",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "The logistic map is a simple equation that describes changes in population over time where " + 
                "x\u2099 is the current population and r is a rate coefficient."),
            Text("\nx\u2099\u208A\u2081 = rx\u2099(1-x\u2099)\n",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
            Text(
                "The equation is interesting as its behavior changes for different values of r. Low values tend " + 
                "to converge on set values regardless of starting population. However, as r increases, the population changes " +
                "start to display periodic behavior, and, beyond a certain point, this periodicity becomes " + 
                "entirely unpredictable. As a result, the logistic map is often cited as an example of how chaotic behavior " + 
                "can result from relatively simple systems and rules."
                ),
            Text(
              "\n\nHow to Use This Simulation\n",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "The simulation allows you to set the starting population as a proportion within [0.0, 1.0] and the " + 
                "rate coefficient within [0.0, 4.0]. After setting these conditions, \"Run Simulation\" will concurrently " + 
                "create and simulate 10 populations. Each starting population is offset by a slight error margin which " +
                "emulates the error margins of real-world measurements. After the simulation finishes, a playback " + 
                "slider will appear which can be used to rewind the simulation to exact points in time."),
          ],
        ));
  }
}
