import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/combons.dart';

class celanderItem extends StatelessWidget {
  const celanderItem(
      {super.key,
      required this.day,
      this.onTap,
      this.isSelected = false // required this.nameDay,
      });
  final DateTime day;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final String nameDay = DateFormat('EEEE').format(day);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? kprimary1Colour : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(9))),
        height: 80,
        width: 50,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("${nameDay[0]}${nameDay[1]}${nameDay[2]}",
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black)),
            const SizedBox(
              height: 12,
            ),
            Text("${day.day}",
                style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.white : Colors.black)),
            SizedBox(height: 8),
            Text(
              "${DateFormat('MMMM').format(day)}",
              style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
