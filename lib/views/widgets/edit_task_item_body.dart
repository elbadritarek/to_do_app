import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_add_button.dart';
import 'package:to_do_app/views/widgets/custom_elevated_button.dart';
import 'package:to_do_app/views/widgets/custom_text_from_feild.dart';

class EdtiTaskItemBody extends StatefulWidget {
  const EdtiTaskItemBody({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<EdtiTaskItemBody> createState() => _EdtiTaskItemBodyState();
}

class _EdtiTaskItemBodyState extends State<EdtiTaskItemBody> {
  String? title;
  String? des;
  DateTime? selectedDate;

  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    selectedDate = widget.taskModel.dateTime;
    selectedTime = widget.taskModel.time;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(height: 120),
            customTextFeild(
                onChange: (value) {
                  title = value;
                },
                hintText: widget.taskModel.title),
            SizedBox(height: 8),
            customTextFeild(
                onChange: (value) {
                  des = value;
                },
                maxLines: 5,
                hintText: widget.taskModel.descrption),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            CustomAddButton(
              title: "DONE",
              onTap: () {
                widget.taskModel.title = title ?? widget.taskModel.title;
                widget.taskModel.descrption =
                    des ?? widget.taskModel.descrption;
                widget.taskModel.dateTime =
                    selectedDate ?? widget.taskModel.dateTime;
                widget.taskModel.time = selectedTime ?? widget.taskModel.time;
                widget.taskModel.save();

                BlocProvider.of<TaskCubit>(context).fatchAllTask();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
