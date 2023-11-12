import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/add_task_form.dart';

class customDielog extends StatelessWidget {
  const customDielog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        color: kprimary2Colour,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 400,
          width: 300,
          child: AddTaskFrom(),
        ),
      ),
    );
  }
}
