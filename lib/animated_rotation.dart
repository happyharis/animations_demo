import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              transform: Transform.rotate(angle: _counter * pi / 6).transform,
              child: AnimatedDefaultTextStyle(
                style: Theme.of(context).textTheme.display1.copyWith(
                    color:
                        _counter.isEven ? Colors.blue[100] : Colors.red[300]),
                child: Text(
                  '$_counter',
                ),
                duration: Duration(seconds: 2),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// end of rotation and tween value doesnt know how to go past
// 360 and it went back to zero
// implicit not be able to do what i wana do
