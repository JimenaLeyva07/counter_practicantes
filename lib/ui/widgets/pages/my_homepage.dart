import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practicantes_counter/controllers/counter_controller.dart';
import 'package:practicantes_counter/models/model_counter.dart';

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

  void _incrementCounter() {
    setState(() {
      counterController
          .incrementCounter(counterController.modelCounter.counter + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbarWidget(title: "Counter Demo"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterController.modelCounter.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
