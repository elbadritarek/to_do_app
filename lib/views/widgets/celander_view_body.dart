import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/views/widgets/custom_list_view_task.dart';
import 'package:to_do_app/views/widgets/home_veiw_body.dart';

class celanderViewBody extends StatefulWidget {
  const celanderViewBody({super.key});

  @override
  State<celanderViewBody> createState() => _celanderViewBodyState();
}

class _celanderViewBodyState extends State<celanderViewBody> {
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        coustomAppBar(
            title:
                "celander :${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}"),
        TableCalendar(
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
                          title: Text(
                              "${_selectedDay!.day}/${_selectedDay!.month}"),
                          centerTitle: true,
                        ),
                        body: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child:
                                customListViewTask(dateTime: _selectedDay!)));
                  },
                ));
              });
            }),
      ],
    );
  }
}
