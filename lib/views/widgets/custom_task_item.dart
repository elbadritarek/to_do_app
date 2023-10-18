import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/combons.dart';

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
              color: kprimary2Colour,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: kprimary1Colour,
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
