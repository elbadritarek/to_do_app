import 'package:flutter/material.dart';

class honeViewBody extends StatelessWidget {
  const honeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customCelander(),
      ],
    );
  }
}

class customCelander extends StatelessWidget {
  const customCelander({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          celanderItem(),
          celanderItem(),
          celanderItem(),
          celanderItem(),
          celanderItem(),
          celanderItem(),
          celanderItem(),
        ],
      ),
    );
  }
}

class celanderItem extends StatelessWidget {
  const celanderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      height: 80,
      width: 50,
      child: Column(
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
