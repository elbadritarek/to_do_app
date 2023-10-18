import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/celander_item.dart';

class customCelander extends StatelessWidget {
  const customCelander({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
      ],
    );
  }
}
