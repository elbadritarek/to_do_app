import 'package:bloc/bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/services/notifi_service.dart';

part 'add_notification_state.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit() : super(AddNotificationInitial());

  Future<void> showNotification(
      TaskModel task, tz.TZDateTime scheduledDate) async {
    await NotificationServices().notificationPlugin.zonedSchedule(
        0,
        task.title,
        task.descrption,
        scheduledDate,
        NotificationServices().notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> addNotifi(
      var notificationBox, TaskModel notificationTask) async {
    DateTime timeNotif = DateTime.now();
    DateTime timeTask = notificationTask.dateTime;
    Duration time = timeNotif.difference(timeTask);

    Future.delayed(time, () async {
      await notificationBox.add(notificationTask);
    });
  }

  addNotification(TaskModel notificationTask) async {
    emit(AddNotificationLoading());
    try {
      var notificationBox = Hive.box<TaskModel>(kNotificatonBox);
      DateTime s = DateTime(
          notificationTask.dateTime.year,
          notificationTask.dateTime.month,
          notificationTask.dateTime.day,
          notificationTask.time.hour,
          notificationTask.time.minute);

      tz.initializeTimeZones();
      var scheduledDate = tz.TZDateTime.from(
          s.add(const Duration(seconds: 10)), tz.getLocation("Africa/Tripoli"));
      if (scheduledDate
          .isAfter(tz.TZDateTime.now(tz.getLocation("Africa/Tripoli")))) {
        NotificationServices().initNotification();

        await showNotification(notificationTask, scheduledDate);
        addNotifi(notificationBox, notificationTask);
      } else {}
      emit(AddNotificationSuccess());
    } catch (e) {
      emit(AddNotificationFailure(e.toString()));
    }
  }
}
