import 'package:flutter/material.dart';
import 'package:flutter_counter_app_with_provider/counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (_) => Counter(0),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hi");
    final counter = Provider.of<Counter>(
      context,
      // listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Consumer<Counter>(builder: (context, data, child) {
            //   return Text(
            //     '${data.getCounter()}',
            //     style: Theme.of(context).textTheme.display1,
            //   );
            // }),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counter.reset,
            tooltip: 'Reset',
            child: Icon(Icons.replay),
          )
        ],
      ),
    );
  }
}
