import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/edit_task_item_body.dart';

class EdtiTaskItem extends StatelessWidget {
  const EdtiTaskItem({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimary2Colour,
      appBar: AppBar(title: const Text("Edit a Task")),
      body: EdtiTaskItemBody(taskModel: task),
    );
  }
}
