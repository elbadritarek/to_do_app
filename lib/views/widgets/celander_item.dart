import 'package:flutter/material.dart';

class celanderItem extends StatelessWidget {
  const celanderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      height: 80,
      width: 50,
      child: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Su"),
          SizedBox(
            height: 12,
          ),
          Text("1", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
