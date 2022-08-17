import 'package:cambridge_wealth/bloc/notifications/bloc.dart';
import 'package:cambridge_wealth/repositories/notification_repository.dart';
import 'package:cambridge_wealth/utils/style.dart';
import 'package:cambridge_wealth/widgets/notification_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNotification extends StatelessWidget{
  const PhoneNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (context) => NotificationBloc(NotificationRepository()),

      child: const SafeArea(

        child: Scaffold(

          backgroundColor: Colors.black,
          body: NotificationSection(marginLeft: Spacing.space16,marginRight: Spacing.space16,marginTop: Spacing.space16),

        ),
      ),
    );

  }



}