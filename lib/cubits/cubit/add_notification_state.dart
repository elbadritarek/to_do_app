part of 'add_notification_cubit.dart';

@immutable
sealed class AddNotificationState {}

final class AddNotificationInitial extends AddNotificationState {}

final class AddNotificationLoading extends AddNotificationState {}

final class AddNotificationSuccess extends AddNotificationState {}

final class AddNotificationFailure extends AddNotificationState {
  final String errMessage;

  AddNotificationFailure(this.errMessage);
}
