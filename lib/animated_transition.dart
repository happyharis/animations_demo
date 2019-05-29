import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // allows animation to tick
  int _counter = 0;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      upperBound: double.infinity,
      vsync: this,
    );
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _animationController.animateTo(_counter / 12.0);
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
            RotationTransition(
              turns: _animationController,
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
