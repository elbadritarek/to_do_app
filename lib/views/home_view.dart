import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';
import 'package:to_do_app/views/widgets/custom_dielog.dart';

import 'widgets/home_veiw_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const honeViewBody(),
      bottomNavigationBar: const bottomAppBar(),
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

