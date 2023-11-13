import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      await taskBox.add(task);
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
