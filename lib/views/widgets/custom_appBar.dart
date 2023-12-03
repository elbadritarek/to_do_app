import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';

class coustomAppBar extends StatelessWidget {
  const coustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    /*required this.icon*/
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      backgroundColor: kprimary1Colour,
    );
  }
}
