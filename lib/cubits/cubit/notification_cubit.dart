import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  List<TaskModel>? task;
  fatchAllNotification() {
    emit(NotificationLoading());
    try {
      var notificationBox = Hive.box<TaskModel>(kNotificatonBox);
      task = notificationBox.values.toList();
      emit(NotificationSuccess());
    } catch (e) {
      emit(NotificationFailure(e.toString()));
    }
  }
}
