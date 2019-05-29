import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation = ColorTween(begin: Colors.amber, end: Colors.blue).animate(
        animationController)
      // cascade annotation. Chain the add listener onto the return value of the above statement
      ..addStatusListener((state) => print('$state'));
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _counter.isEven
        ? animationController.forward()
        : animationController.reverse();
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
            AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Text(
                  '$_counter',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: animation.value),
                );
              },
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
