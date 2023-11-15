import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/edit_task.dart';

class customTaskItem extends StatefulWidget {
  const customTaskItem({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<customTaskItem> createState() => _customTaskItemState();
}

class _customTaskItemState extends State<customTaskItem> {
  @override
  build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EdtiTaskItem(task: widget.taskModel);
          },
        ));
      },
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                if (widget.taskModel.isDone == false) {
                  widget.taskModel.isDone = true;
                  setState(() {});
                } else {
                  widget.taskModel.isDone = false;
                  setState(() {});
                }
              },
              icon: widget.taskModel.isDone
                  ? Icon(FontAwesomeIcons.circleCheck)
                  : Icon(FontAwesomeIcons.circle)),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 11, bottom: 8),
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: kprimary2Colour,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text("${widget.taskModel.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: widget.taskModel.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic)),
                          SizedBox(height: 5),
                          Text("${widget.taskModel.descrption}",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
