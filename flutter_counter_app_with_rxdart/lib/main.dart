import 'package:flutter/material.dart';
import 'package:flutter_counter_app_with_rxdart/bloc/counterBloc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Demo()
        // MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class Demo extends StatelessWidget {
  Demo({Key? key}) : super(key: key);
  final CounterBloc _counterBloc = new CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:'),
            new StreamBuilder(
                stream: _counterBloc.counterObservable,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  return new Text('${snapshot.data}',
                      style: Theme.of(context).textTheme.display1);
                })
          ],
        ),
      ),
      floatingActionButton: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: new FloatingActionButton(
                onPressed: _counterBloc.increment,
                tooltip: 'Increment',
                child: new Icon(Icons.add),
              )),
          new FloatingActionButton(
            onPressed: _counterBloc.decrement,
            tooltip: 'Decrement',
            child: new Icon(Icons.remove),
          ),
          new FloatingActionButton(
            onPressed: _counterBloc.reset,
            tooltip: 'Reset',
            child: new Icon(Icons.replay),
          ),
        ],
      ),
    );
  }
}
