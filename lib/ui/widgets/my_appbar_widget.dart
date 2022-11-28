import 'package:flutter/material.dart';

class MyAppbarWidget extends StatelessWidget with PreferredSizeWidget {
  const MyAppbarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50.0);
}
