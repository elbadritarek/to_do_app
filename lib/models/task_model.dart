import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String descrption;
  final DateTime dateTime;
  final TimeOfDay time;
  final int colour;

  TaskModel({
    required this.title,
    required this.descrption,
    required this.dateTime,
    required this.time,
    required this.colour,
  });
}
