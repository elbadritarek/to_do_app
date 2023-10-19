import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';
import 'package:to_do_app/views/widgets/custom_text_from_feild.dart';

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

class customDielog extends StatelessWidget {
  const customDielog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        color: kprimary2Colour,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(children: [
            // SizedBox(height: 8),
            Text(
              "New Task",
              style: TextStyle(
                  color: kprimary1Colour,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            coustomTextFeild(hintText: "Title"),
            SizedBox(height: 8),
            coustomTextFeild(
              hintText: "Descrption",
              maxLines: 5,
            ),
            SizedBox(height: 8),
            CustomRowElevatedButton()
          ]),
        ),
      ),
    );
  }
}

class CustomRowElevatedButton extends StatefulWidget {
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
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.selectedDate,
      required this.func,
      required this.title,
      required this.icon});
  final dynamic selectedDate;
  final VoidCallback func;
  final dynamic title;
  final IconData icon;
  /*selectDate(BuildContext context) async {
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
  }*/

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon), SizedBox(width: 4), Text("$title")]),
      onPressed: func,
    );
  }
}
