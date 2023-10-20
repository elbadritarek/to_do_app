import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/celander_item.dart';

class customCelander extends StatelessWidget {
  const customCelander({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        celanderItem(day: DateTime.now().subtract(const Duration(days: 3))),
        celanderItem(day: DateTime.now().subtract(const Duration(days: 2))),
        celanderItem(day: DateTime.now().subtract(const Duration(days: 1))),
        celanderItem(day: DateTime.now()),
        celanderItem(day: DateTime.now().add(const Duration(days: 1))),
        celanderItem(day: DateTime.now().add(const Duration(days: 2))),
        celanderItem(day: DateTime.now().add(const Duration(days: 3))),
      ],
    );
  }
}
