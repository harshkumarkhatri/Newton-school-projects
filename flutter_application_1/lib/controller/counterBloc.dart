import 'dart:async';

// This is created to have variety for the event.
enum CounterActions { Increment, Decrement, Reset }

class CounterController {
  int counter = 0;
  final streamController = StreamController<int>();
  // final sinkController = StreamController();
  StreamSink<int> get counterSink => streamController.sink;
  Stream<int> get counterStream => streamController.stream;

  final eventController = StreamController<CounterActions>();
  StreamSink<CounterActions> get eventSink => eventController.sink;
  Stream<CounterActions> get eventStream => eventController.stream;

  CounterController() {
    // ignore: unnecessary_null_comparison
    if (counter == null) {
      counter = 0;
      counterSink.add(counter);
    }
    eventStream.listen((event) {
      if (event == CounterActions.Increment) {
        counter++;
        print("Increment event called");
      } else if (event == CounterActions.Decrement) {
        print("Decrement event called");
        counter--;
      } else if (event == CounterActions.Reset) counter = 0;

      counterSink.add(counter);
    });
  }

  void dispose() {
    eventController.close();
    streamController.close();
  }
}
