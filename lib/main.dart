import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/cubits/cubit/notification_cubit.dart';
import 'package:to_do_app/cubits/cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/home_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());
  var box = await Hive.openBox<TaskModel>(kTaskBox);
  var notificatonBox = await Hive.openBox<TaskModel>(kNotificatonBox);
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
