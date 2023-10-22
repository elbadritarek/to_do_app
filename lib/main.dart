import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/home_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<TaskModel>(kTaskBox);

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
