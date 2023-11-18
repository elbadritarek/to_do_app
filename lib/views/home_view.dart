import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';
import 'package:to_do_app/views/widgets/custom_dielog.dart';
import 'package:to_do_app/views/widgets/custom_list_view_task.dart';

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

class celanderViewBody extends StatefulWidget {
  const celanderViewBody({super.key});

  @override
  State<celanderViewBody> createState() => _celanderViewBodyState();
}

class _celanderViewBodyState extends State<celanderViewBody> {
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        firstDay: DateTime.utc(1900),
        lastDay: DateTime.utc(2100),
        focusedDay: _selectedDay!,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            // _focusedDay = focusedDay; // update `_focusedDay` here as well
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                    appBar: AppBar(
                      title:
                          Text("${_selectedDay!.day}/${_selectedDay!.month}"),
                      centerTitle: true,
                    ),
                    body: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: customListViewTask(dateTime: _selectedDay!)));
              },
            ));
          });
        });
  }
}
