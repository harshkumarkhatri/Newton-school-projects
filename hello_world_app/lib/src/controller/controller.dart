import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount = 0;
  BehaviorSubject<int>? _subjectCounter;

  CounterBloc({required this.initialCount}) {
    _subjectCounter = new BehaviorSubject.seeded(this.initialCount);
  }

  ValueStream<int> get counterObservable => _subjectCounter!.stream;

  void increment() {
    initialCount++;
    _subjectCounter!.sink.add(initialCount);
  }

  void decrement() {
    initialCount--;
    _subjectCounter!.sink.add(initialCount);
  }

  void reset() {
    initialCount = 0;
    _subjectCounter!.sink.add(initialCount);
  }

  void dispose() {
    _subjectCounter!.close();
  }
}
