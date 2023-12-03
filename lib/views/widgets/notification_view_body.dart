import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/cubit/notification_cubit.dart';
import 'package:to_do_app/views/widgets/custom_appBar.dart';
import 'package:to_do_app/views/widgets/custom_listview_Notification.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotificationCubit>(context).fatchAllNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        coustomAppBar(
            icon: Icons.notifications_none_sharp, title: "Notification"),
        Expanded(child: customListViewNotification()),
      ],
    );
  }
}
