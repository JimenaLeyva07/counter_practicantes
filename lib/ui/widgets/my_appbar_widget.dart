import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicantes_counter/main.dart';

class MyAppbarWidget extends ConsumerWidget with PreferredSizeWidget {
  const MyAppbarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final appbarCounter = ref.watch(counterState);
        final appbarChange = ref.watch(counterChange).counterController.counter;
        return AppBar(
          title: Text('$title - $appbarCounter - $appbarChange'),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50.0);
}
