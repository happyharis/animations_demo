import 'package:flare_flutter/flare_actor.dart';
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
            AnimatedDefaultTextStyle(
              style: Theme.of(context).textTheme.display1.copyWith(
                    color: _counter.isEven ? Colors.blue[100] : Colors.red[300],
                    // fontFamily: _counter.isEven ? 'Arial' : 'Times New Roman',
                    // fontSize: _counter.isEven ? 10 : 100,
                  ),
              child: Text(
                '$_counter',
              ),
              duration: Duration(seconds: 2),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FlareActor(
                  'assets/star.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: _counter.isEven ? 'go' : 'idle',
                ),
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
