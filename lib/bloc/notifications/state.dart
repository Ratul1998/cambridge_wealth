import 'package:cambridge_wealth/models/notification_data.dart';

abstract class NotificationState{}

class UnInitializedState extends NotificationState{}

class FetchingState extends NotificationState{}

class FetchedState extends NotificationState{

  final List<NotificationData> notifications;

  FetchedState({required this.notifications});

}

class ErrorState extends NotificationState{

  final String message;

  ErrorState({required this.message});


}