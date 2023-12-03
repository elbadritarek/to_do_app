import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_appBar.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

class allTaskViewBody extends StatelessWidget {
  const allTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = BlocProvider.of<TaskCubit>(context).task!;
        return Column(
          children: [
            const coustomAppBar(
                icon: FontAwesomeIcons.listCheck, title: "All Task"),
            Expanded(
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                        endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.delete,
                                label: "delete",
                                onPressed: (context) {
                                  var taskBox = Hive.box<TaskModel>(kTaskBox);
                                  taskBox.deleteAt(index);
                                  BlocProvider.of<TaskCubit>(context)
                                      .fatchAllTask();
                                },
                              )
                            ]),
                        child: customTaskItem(
                          taskModel: taskList[index],
                        ));
                  }),
            ),
          ],
        );
      },
    );
  }
}
