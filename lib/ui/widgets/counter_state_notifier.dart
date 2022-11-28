import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicantes_counter/controllers/counter_controller.dart';
import 'package:practicantes_counter/models/model_counter.dart';

class CounterStateNotifier extends StateNotifier {
  CounterStateNotifier(super.state);

  CounterController counterController =
      CounterController(modelCounter: ModelCounter());

  void incrementCounter() {
    counterController.incrementCounter(counterController.counter + 1);
    state = counterController.counter;
  }
}
