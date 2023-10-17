import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class honeViewBody extends StatelessWidget {
  const honeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customCelander(),
        SizedBox(
          height: 10,
        ),
        customTaskItem(),
      ],
    );
  }
}

class customTaskItem extends StatelessWidget {
  const customTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.circle)),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 11),
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: Colors.orangeAccent,
                    thickness: 5,
                    width: 5,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Text("Flutter study plan",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      SizedBox(height: 5),
                      Text("study flutter every day ",
                          style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class customCelander extends StatelessWidget {
  const customCelander({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
        celanderItem(),
      ],
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
