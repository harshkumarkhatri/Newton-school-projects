import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app_with_bloc/counter/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.plus_one),
          ),
          SizedBox(
            width: 32,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(DecrementEvent());
            },
            tooltip: 'Decrement',
            child: Icon(
              Icons.exposure_minus_1,
            ),
          ),
          SizedBox(
            width: 32,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(ResetEvent());
            },
            tooltip: 'Reset',
            child: Icon(
              Icons.replay,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }
}
