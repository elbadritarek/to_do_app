import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/add_notification_cubit.dart';
import 'package:to_do_app/cubits/cubit/add_task_cubit.dart';
import 'package:to_do_app/cubits/cubit/notification_cubit.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/views/widgets/add_task_form.dart';

class customDielog extends StatelessWidget {
  const customDielog({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTaskCubit(),
        ),
        BlocProvider(
          create: (context) => AddNotificationCubit(),
        ),
      ],
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) async {
          if (state is AddTaskFailure) {
            print("fail");
          } else if (state is AddTaskSuccess) {
            BlocProvider.of<TaskCubit>(context).fatchAllTask();
            BlocProvider.of<NotificationCubit>(context).fatchAllNotification();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTaskLoading ? true : false,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Container(
                color: kprimary2Colour,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: SingleChildScrollView(child: AddTaskFrom()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
