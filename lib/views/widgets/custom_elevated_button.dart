import 'package:flutter/material.dart';

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
