import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/add_task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/services/notifi_service.dart';
import 'package:to_do_app/views/widgets/custom_add_button.dart';
import 'package:to_do_app/views/widgets/custom_elevated_button.dart';
import 'package:to_do_app/views/widgets/custom_text_from_feild.dart';

class AddTaskFrom extends StatefulWidget {
  const AddTaskFrom({
    super.key,
  });

  @override
  State<AddTaskFrom> createState() => _AddTaskFromState();
}

class _AddTaskFromState extends State<AddTaskFrom> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? des;
  DateTime? selectedDate = DateTime.now();

  TimeOfDay? selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        // SizedBox(height: 8),
        Text(
          "New Task",
          style: TextStyle(
              color: kprimary1Colour,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        customTextFeild(
          hintText: "Title",
          onSaved: (data) {
            title = data;
          },
        ),
        SizedBox(height: 8),
        customTextFeild(
          hintText: "Descrption",
          maxLines: 5,
          onSaved: (data) {
            des = data;
          },
        ),
        SizedBox(height: 8),
        Row(
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
        ),
        SizedBox(height: 20),
        BlocBuilder<AddTaskCubit, AddTaskState>(
          builder: (context, state) {
            return CustomAddButton(
                isLoding: state is AddTaskLoading ? true : false,
                onTap: () async {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    var taskModel = TaskModel(
                        title: title!,
                        descrption: des!,
                        dateTime: selectedDate!,
                        time: selectedTime!,
                        colour: Colors.blue.value);
                    DateTime s = DateTime(
                        selectedDate!.year,
                        selectedDate!.month,
                        selectedDate!.day,
                        selectedTime!.hour,
                        selectedTime!.minute);
                    tz.initializeTimeZones();
                    var scheduledDate = tz.TZDateTime.from(
                        s.add(const Duration(seconds: 10)),
                        tz.getLocation("Africa/Tripoli"));
                    if (scheduledDate.isAfter(
                        tz.TZDateTime.now(tz.getLocation("Africa/Tripoli")))) {
                      NotificationServices().initNotification();

                      await NotificationServices()
                          .notificationPlugin
                          .zonedSchedule(0, title!, des!, scheduledDate,
                              NotificationServices().notificationDetails(),
                              androidScheduleMode: AndroidScheduleMode
                                  .exactAllowWhileIdle,
                              uiLocalNotificationDateInterpretation:
                                  UILocalNotificationDateInterpretation
                                      .absoluteTime);
                    } else {}

                    BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                });
          },
        )
      ]),
    );
  }
}
