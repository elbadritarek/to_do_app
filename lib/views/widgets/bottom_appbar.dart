import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/combons.dart';

class bottomAppBar extends StatefulWidget {
  const bottomAppBar({super.key, required this.control});
  final PageController control;
  @override
  State<bottomAppBar> createState() => _bottomAppBarState();
}

class _bottomAppBarState extends State<bottomAppBar> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /*AnimatedPositioned(
          child: Container(
            height: 50,
            width: 90,
            color: kprimary2Colour,
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut),*/
      Row(
        children: [
          Spacer(flex: 1),
          Container(
            height: 50,
            width: 60,
            color: selectIndex == 0 ? kprimary2Colour : Colors.white,
            child: IconButton(
                onPressed: () {
                  widget.control.animateToPage(0,
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                  selectIndex == 0;
                  setState(() {
                    selectIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                )),
          ),
          Spacer(flex: 2),
          Container(
            height: 50,
            width: 60,
            color: selectIndex == 1 ? kprimary2Colour : Colors.white,
            child: IconButton(
                onPressed: () {
                  widget.control.animateToPage(1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  selectIndex == 1;
                  setState(() {
                    selectIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.calendar_month,
                  size: 30,
                )),
          ),
          Spacer(flex: 3),
          Container(
            height: 50,
            width: 60,
            color: selectIndex == 2 ? kprimary2Colour : Colors.white,
            child: IconButton(
                onPressed: () {
                  widget.control.animateToPage(2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  selectIndex == 2;
                  setState(() {
                    selectIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.notifications_none_sharp,
                  size: 30,
                )),
          ),
          Spacer(flex: 2),
          Container(
            height: 50,
            width: 60,
            color: selectIndex == 3 ? kprimary2Colour : Colors.white,
            child: IconButton(
                onPressed: () {
                  widget.control.animateToPage(3,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                  selectIndex == 3;
                  setState(() {
                    selectIndex = 3;
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.listCheck,
                  size: 30,
                )),
          ),
          Spacer(flex: 1),
        ],
      ),
    ]);
  }
}
