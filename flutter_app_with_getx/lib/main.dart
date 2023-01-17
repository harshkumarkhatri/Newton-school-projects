import 'package:flutter/material.dart';
import 'package:flutter_app_with_getx/controller/controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final CounterController _controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
              builder: (controller) => Text(
                "Data is  ${controller.count}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.decrement();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.reset();
            },
            child: Icon(Icons.replay),
          ),
        ],
      ),
    );
  }
}
