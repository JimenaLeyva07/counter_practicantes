import 'package:flutter/material.dart';
import 'package:practicantes_counter/controllers/counter_controller.dart';
import 'package:practicantes_counter/models/model_counter.dart';
import 'package:practicantes_counter/ui/widgets/counter_inherited_widget.dart';

import '../my_appbar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterController counterController;

  @override
  void initState() {
    super.initState();
    counterController = CounterController(modelCounter: ModelCounter());
  }

  void incrementCounter() {
    setState(() {
      counterController.incrementCounter(counterController.counter + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      counterController: counterController,
      function: incrementCounter,
      counter: counterController.counter,
      child: Scaffold(
        appBar: const MyAppbarWidget(title: "Counter Demo"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              CounterDisplayWidget(),
            ],
          ),
        ),
        floatingActionButton: const CounterIncrementWidget(),
      ),
    );
  }
}

class CounterIncrementWidget extends StatelessWidget {
  const CounterIncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CounterInheritedWidget.of(context).function();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${CounterInheritedWidget.of(context).counterController.counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
