import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/views/widgets/custom_appBar.dart';
import 'package:to_do_app/views/widgets/custom_celander.dart';
import 'package:to_do_app/views/widgets/custom_list_view_task.dart';

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

  DateTime date = DateTime.now();
  void upDateDate(DateTime dateTime) {
    setState(() {
      date = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const coustomAppBar(icon: Icons.home, title: "ToDo App"),
        const SizedBox(height: 5),
        customCelander(updateData: upDateDate),
        Expanded(
            child: customListViewTask(
          dateTime: date,
        )),
      ],
    );
  }
}
