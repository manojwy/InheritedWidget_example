import 'package:flutter/material.dart';
import 'package:flutter_app_2/Provider.dart';

class AppState extends ValueNotifier {
  AppState(value) : super(value);

  int secondCounter = 0;
}

var appState = new AppState(false);

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Provider(
      data: appState,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new MyHomePage2()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  _incrementCounter(context) {
    var appState = Provider.of(context);
    appState.secondCounter += 1;
    appState.value = !appState.value;
    print("Set: ${appState.secondCounter}");
  }
}


class MyHomePage2 extends StatelessWidget {
  MyHomePage2({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
            new MyHomePage3();
  }
}


class MyHomePage3 extends StatelessWidget {
  MyHomePage3({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of(context).secondCounter;
    print("Build: $_counter");
    return
      new Text(
        'Counter: $_counter',
        style: Theme.of(context).textTheme.display1,
      );
  }
}