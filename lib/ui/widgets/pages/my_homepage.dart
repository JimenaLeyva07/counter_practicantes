import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicantes_counter/main.dart';

import '../my_appbar_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class CounterIncrementWidget extends ConsumerWidget {
  const CounterIncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterState.notifier).incrementCounter();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterDisplayWidget extends ConsumerWidget {
  const CounterDisplayWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final counterWatch = ref.watch(counterState);
        return Text(
          '$counterWatch',
          style: Theme.of(context).textTheme.headlineLarge,
        );
      },
    );
  }
}
