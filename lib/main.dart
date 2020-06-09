import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Slider(
              value: rating,
              onChanged: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
              min: 0.0,
              max: 10.0,
            ),
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SecondRoute(rating)),
    );
    if (result != null) {
      setState(() {
        rating = result;
      });
    }
  }
}

class SecondRoute extends StatefulWidget {
  final double rating;
  SecondRoute(this.rating);

  @override
  _SecondRouteState createState() => _SecondRouteState(rating);
}

class _SecondRouteState extends State<SecondRoute> {
  double rating2;
  _SecondRouteState(this.rating2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Slider(
              value: rating2,
              onChanged: (newRating) {
                setState(() {
                  rating2 = newRating;
                });
              },
              min: 0.0,
              max: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, rating2);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}