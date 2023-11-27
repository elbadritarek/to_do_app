part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {}

final class NotificationFailure extends NotificationState {
  final String errMessage;

  NotificationFailure(this.errMessage);
}
