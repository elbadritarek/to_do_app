import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

import '../../cubits/cubit/task_cubit.dart';

class customListViewTask extends StatelessWidget {
  const customListViewTask({super.key, required this.dateTime});
  //final void Function(DateTime dateTime) updateData;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = BlocProvider.of<TaskCubit>(context).task!;
        return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                  endActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                      icon: Icons.delete,
                      label: "delete",
                      onPressed: (context) {
                        var taskBox = Hive.box<TaskModel>(kTaskBox);
                        taskBox.deleteAt(index);
                        BlocProvider.of<TaskCubit>(context).fatchAllTask();
                      },
                    )
                  ]),
                  child: dateTime.day == taskList[index].dateTime.day &&
                          dateTime.month == taskList[index].dateTime.month
                      ? customTaskItem(
                          taskModel: taskList[index],
                        )
                      : const SizedBox());
            });
      },
    );
  }
}
