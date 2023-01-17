import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/counterBloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final counterBloc = CounterController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                  stream: counterBloc.counterStream,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  })
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                // ++_counter;
                counterBloc.eventSink.add(CounterActions.Increment);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                // ++_counter;
                counterBloc.eventSink.add(CounterActions.Decrement);
              },
              tooltip: 'Decrement',
              child: Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              onPressed: () {
                // ++_counter;
                counterBloc.eventSink.add(CounterActions.Reset);
              },
              tooltip: 'Reset',
              child: Icon(Icons.loop),
            ),
          ],
        ),
      ),
    );
  }
}
