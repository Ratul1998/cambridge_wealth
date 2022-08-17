import 'package:cambridge_wealth/bloc/notifications/event.dart';
import 'package:cambridge_wealth/bloc/notifications/state.dart';
import 'package:cambridge_wealth/models/notification_data.dart';
import 'package:cambridge_wealth/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationRepository notificationRepository)
      : super(UnInitializedState()) {
    on<FetchNotificationData>((event, emit) async {
      emit(FetchingState());
      try {
        List<NotificationData> notifications =
            await notificationRepository.getNotifications();

        emit(FetchedState(notifications: notifications));
      } catch (error) {
        emit(ErrorState(message: 'Something went wrong'));
      }
    });
  }
}
