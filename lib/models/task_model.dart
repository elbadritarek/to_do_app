import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String descrption;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  final TimeOfDay time;
  @HiveField(4)
  final int colour;

  TaskModel({
    required this.title,
    required this.descrption,
    required this.dateTime,
    required this.time,
    required this.colour,
  });
}
