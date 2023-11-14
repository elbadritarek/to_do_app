import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_celander.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

class honeViewBody extends StatefulWidget {
  const honeViewBody({super.key});

  @override
  State<honeViewBody> createState() => _honeViewBodyState();
}

class _honeViewBodyState extends State<honeViewBody> {
  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).fatchAllTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customCelander(),
        SizedBox(
          height: 12,
        ),
        Expanded(child: customListViewTask()),
      ],
    );
  }
}

class customListViewTask extends StatelessWidget {
  const customListViewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = BlocProvider.of<TaskCubit>(context).task!;
        return ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return customTaskItem(
              taskModel: taskList[index],
            );
          },
        );
      },
    );
  }
}
