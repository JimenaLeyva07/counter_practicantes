import 'package:flutter/material.dart';
import 'package:practicantes_counter/ui/widgets/counter_inherited_widget.dart';

class MyAppbarWidget extends StatelessWidget with PreferredSizeWidget {
  const MyAppbarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$title - ${CounterInheritedWidget.of(context).counter}'),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50.0);
}
