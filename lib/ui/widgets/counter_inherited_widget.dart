import 'package:flutter/material.dart';
import 'package:practicantes_counter/controllers/counter_controller.dart';

class CounterInheritedWidget extends InheritedWidget {
  const CounterInheritedWidget(
      {super.key,
      required super.child,
      required this.counterController,
      required this.function,
      required this.counter});

  final CounterController counterController;
  final Function function;
  final int counter;

  static CounterInheritedWidget of(BuildContext context) {
    CounterInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
    assert(result != null, 'No CounterInheritedWidget found');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}
