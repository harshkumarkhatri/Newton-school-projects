import 'package:flutter/material.dart';
import 'package:hello_world_app/src/controller/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CounterBloc _counterBloc = CounterBloc(initialCount: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "State management",
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counterBloc.counterObservable,
          builder: (context, snapshot) {
            return Text("Data is ${snapshot.data}");
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _counterBloc.increment,
            tooltip: "Inc",
            child: Icon(
              Icons.plus_one,
            ),
          ),
          FloatingActionButton(
            onPressed: _counterBloc.decrement,
            tooltip: "Dec",
            child: Icon(
              Icons.exposure_minus_1,
            ),
          ),
          FloatingActionButton(
            onPressed: _counterBloc.reset,
            tooltip: "reset",
            child: Icon(
              Icons.replay,
            ),
          ),
        ],
      ),
    );
  }
}
