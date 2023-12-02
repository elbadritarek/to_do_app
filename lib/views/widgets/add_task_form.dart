import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/add_notification_cubit.dart';
import 'package:to_do_app/cubits/cubit/add_task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
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
              width: 20,
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
                    TaskModel notificationModel = taskModel;
                    BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                    BlocProvider.of<AddNotificationCubit>(context)
                        .addNotification(notificationModel);
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
