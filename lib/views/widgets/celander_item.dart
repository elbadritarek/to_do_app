import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            color: isSelected ? const Color(0xff7B66FF) : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        height: 90,
        width: 50,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("${nameDay[0]}${nameDay[1]}${nameDay[2]}",
                style: TextStyle(
                    color:
                        isSelected ? const Color(0xff96EFFF) : Colors.black)),
            const SizedBox(
              height: 12,
            ),
            Text("${day.day}",
                style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Color(0xff96EFFF) : Colors.black)),
            const SizedBox(height: 5),
            Text(
              DateFormat('MMMM').format(day),
              style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? const Color(0xff96EFFF) : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
