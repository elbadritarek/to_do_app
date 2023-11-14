import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String descrption;
  @HiveField(2)
  DateTime dateTime;
  @HiveField(3)
  TimeOfDay time;
  @HiveField(4)
  int colour;
  bool isDone = false;
  TaskModel({
    required this.title,
    required this.descrption,
    required this.dateTime,
    required this.time,
    required this.colour,
  });
}
