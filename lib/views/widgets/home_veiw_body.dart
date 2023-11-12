import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/custom_celander.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

class honeViewBody extends StatelessWidget {
  const honeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        customCelander(),
        SizedBox(
          height: 12,
        ),
        customTaskItem(),
      ],
    );
  }
}
