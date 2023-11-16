import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/celander_item.dart';

class customCelander extends StatefulWidget {
  const customCelander({super.key, required this.updateData});
  final void Function(DateTime dateTime) updateData;
  @override
  State<customCelander> createState() => _customCelanderState();
}

class _customCelanderState extends State<customCelander> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedPositioned(
          child: Container(
            height: 80,
            width: 50,
            color: kprimary2Colour,
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          celanderItem(
              isSelected: selectIndex == -3,
              onTap: () {
                setState(() {
                  widget.updateData(
                      DateTime.now().subtract(const Duration(days: 3)));
                  selectIndex = -3;
                });
              },
              day: DateTime.now().subtract(const Duration(days: 3))),
          celanderItem(
              isSelected: selectIndex == -2,
              onTap: () {
                setState(() {
                  widget.updateData(
                      DateTime.now().subtract(const Duration(days: 2)));
                  selectIndex = -2;
                });
              },
              day: DateTime.now().subtract(const Duration(days: 2))),
          celanderItem(
              isSelected: selectIndex == -1,
              onTap: () {
                setState(() {
                  widget.updateData(
                      DateTime.now().subtract(const Duration(days: 1)));
                  selectIndex = -1;
                });
              },
              day: DateTime.now().subtract(const Duration(days: 1))),
          celanderItem(
              isSelected: selectIndex == 0,
              onTap: () {
                setState(() {
                  widget.updateData(DateTime.now());
                  selectIndex = 0;
                });
              },
              day: DateTime.now()),
          celanderItem(
              isSelected: selectIndex == 1,
              onTap: () {
                setState(() {
                  widget
                      .updateData(DateTime.now().add(const Duration(days: 1)));
                  selectIndex = 1;
                });
              },
              day: DateTime.now().add(const Duration(days: 1))),
          celanderItem(
              isSelected: selectIndex == 2,
              onTap: () {
                setState(() {
                  widget
                      .updateData(DateTime.now().add(const Duration(days: 2)));
                  selectIndex = 2;
                });
              },
              day: DateTime.now().add(const Duration(days: 2))),
          celanderItem(
              isSelected: selectIndex == 3,
              onTap: () {
                setState(() {
                  widget
                      .updateData(DateTime.now().add(const Duration(days: 3)));
                  selectIndex = 3;
                });
              },
              day: DateTime.now().add(const Duration(days: 3))),
        ],
      ),
    ]);
  }
}
