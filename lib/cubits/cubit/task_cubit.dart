import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  fatchAllTask() {
    emit(TaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      emit(TaskSuccess(taskBox.values.toList()));
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }
}
