part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<TaskModel> taskList;

  TaskSuccess(this.taskList);
}

final class TaskFailure extends TaskState {
  final String errMessage;

  TaskFailure(this.errMessage);
}
