import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/notification_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

class customListViewNotification extends StatelessWidget {
  const customListViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      List<TaskModel> taskList =
          BlocProvider.of<NotificationCubit>(context).task!;
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
                    var taskBox = Hive.box<TaskModel>(kNotificatonBox);
                    taskBox.deleteAt(index);
                    BlocProvider.of<NotificationCubit>(context)
                        .fatchAllNotification();
                  },
                )
              ]),
              child: customTaskItem(
                taskModel: taskList[index],
              ));
        },
      );
    });
  }
}
