import 'package:flutter/foundation.dart';

import '../../models/model_counter.dart';
import '../../controllers/counter_controller.dart';

class CounterChangeNotifier extends ChangeNotifier {
  CounterController counterController =
      CounterController(modelCounter: ModelCounter());

  void incrementCounter() {
    counterController.incrementCounter(counterController.counter + 1);
    notifyListeners();
  }
}
