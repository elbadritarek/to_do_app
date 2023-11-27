import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/notification_cubit.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';
import 'package:to_do_app/views/widgets/celander_view_body.dart';
import 'package:to_do_app/views/widgets/custom_dielog.dart';
import 'package:to_do_app/views/widgets/custom_task_item.dart';

import 'widgets/home_veiw_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController control = PageController(initialPage: 0);
  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
          controller: control,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            honeViewBody(),
            celanderViewBody(),
            NotificationViewBody(),
            allTaskViewBody(),
          ]),
      bottomNavigationBar: bottomAppBar(control: control),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimary1Colour,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return customDielog();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class allTaskViewBody extends StatelessWidget {
  const allTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = BlocProvider.of<TaskCubit>(context).task!;
        return Padding(
          padding: EdgeInsets.only(top: 8),
          child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                    endActionPane:
                        ActionPane(motion: StretchMotion(), children: [
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
                    child: customTaskItem(
                      taskModel: taskList[index],
                    ));
              }),
        );
      },
    );
  }
}

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //       coustomAppBar(title: "To Do"),

        SizedBox(
          height: 12,
        ),
        Expanded(child: customListViewNotification()),
      ],
    );
  }
}

class customListViewNotification extends StatelessWidget {
  const customListViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      List<TaskModel> taskList =
          BlocProvider.of<NotificationCubit>(context).task ??
              [
                TaskModel(
                    title: "title",
                    descrption: "descrption",
                    dateTime: DateTime.now(),
                    time: TimeOfDay.now(),
                    colour: 1)
              ];
      return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
              endActionPane: ActionPane(motion: StretchMotion(), children: [
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


/*class CustomRowElevatedButton extends StatefulWidget {
  const CustomRowElevatedButton({super.key});

  @override
  State<CustomRowElevatedButton> createState() =>
      _CustomRowElevatedButtonState();
}

class _CustomRowElevatedButtonState extends State<CustomRowElevatedButton> {
  DateTime? selectedDate = DateTime.now();

  TimeOfDay? selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomElevatedButton(
          icon: FontAwesomeIcons.calendar,
          title: "${selectedDate!.toLocal()}".split(' ')[0],
          selectedDate: selectedDate,
          func: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate!,
              firstDate: DateTime(1949),
              lastDate: DateTime(2100),
            );
            if (picked != null && picked != selectedDate) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
        ),
        SizedBox(
          width: 55,
        ),
        CustomElevatedButton(
          icon: FontAwesomeIcons.clock,
          title: "${selectedTime?.hour} : ${selectedTime?.minute} ",
          selectedDate: selectedTime,
          func: () async {
            final TimeOfDay? picked = await showTimePicker(
                context: context, initialTime: selectedTime!);
            if (picked != null && picked != selectedTime) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
        ),
      ],
    );
  }
}*/
