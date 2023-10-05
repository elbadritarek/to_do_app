import 'package:flutter/material.dart';

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 1),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              size: 30,
            )),
        Spacer(flex: 2),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_month,
              size: 30,
            )),
        Spacer(flex: 3),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              size: 30,
            )),
        Spacer(flex: 2),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 30,
            )),
        Spacer(flex: 1),
      ],
    );
  }
}
