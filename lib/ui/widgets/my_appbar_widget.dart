import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicantes_counter/main.dart';
import 'package:practicantes_counter/ui/widgets/counter_inherited_widget.dart';

class MyAppbarWidget extends StatelessWidget with PreferredSizeWidget {
  const MyAppbarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppbarWidgetConsumer(title: title);
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50.0);
}

class AppbarWidgetConsumer extends ConsumerWidget {
  const AppbarWidgetConsumer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final appbarCounter = ref.watch(counterState);
        return AppBar(
          title: Text('$title - $appbarCounter'),
        );
      },
    );
  }
}
