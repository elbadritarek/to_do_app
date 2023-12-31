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
                  ? const Icon(FontAwesomeIcons.circleCheck)
                  : const Icon(FontAwesomeIcons.circle)),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 11, bottom: 8),
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: kprimary2Colour,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: kprimary1Colour,
                      thickness: 5,
                      width: 5,
                    ),
                  ),
                  const SizedBox(
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
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                          "${widget.taskModel.dateTime.day}/${widget.taskModel.dateTime.month}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: widget.taskModel.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: Colors.black,
                              //fontSize: 10,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(height: 5),
                      Text(
                          "${widget.taskModel.time.hour}:${widget.taskModel.time.minute}",
                          style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 5),
                    ],
                  ),
                  const SizedBox(width: 16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
