import 'package:practicantes_counter/models/model_counter.dart';

class CounterController {
  final ModelCounter modelCounter;

  const CounterController({required this.modelCounter});

  void incrementCounter(int counter) {
    modelCounter.setCounter(counter);
  }

  int get counter => modelCounter.counter;
}
