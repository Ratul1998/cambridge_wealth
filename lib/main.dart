import 'package:cambridge_wealth/bloc/homepage/bloc.dart';
import 'package:cambridge_wealth/bloc/notifications/bloc.dart';
import 'package:cambridge_wealth/repositories/home_repository.dart';
import 'package:cambridge_wealth/repositories/notification_repository.dart';
import 'package:cambridge_wealth/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomePageBloc(HomeRepository())),
            BlocProvider(
                create: (context) =>
                    NotificationBloc(NotificationRepository())),
          ],
          child: const HomePage(),
        ));
  }
}
