import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class celanderItem extends StatelessWidget {
  const celanderItem({
    super.key,
    required this.day, // required this.nameDay,
  });
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final String nameDay = DateFormat('EEEE').format(day);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      height: 80,
      width: 50,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text("${nameDay[0]}${nameDay[1]}${nameDay[2]}"),
          const SizedBox(
            height: 12,
          ),
          Text("${day.day}", style: const TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Text(
            "${DateFormat('MMMM').format(day)}",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
