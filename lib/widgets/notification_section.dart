import 'package:cambridge_wealth/bloc/notifications/bloc.dart';
import 'package:cambridge_wealth/bloc/notifications/event.dart';
import 'package:cambridge_wealth/bloc/notifications/state.dart';
import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_row.dart';

class NotificationSection extends StatefulWidget {

  const NotificationSection({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> NotificationSectionState();

}

class NotificationSectionState extends State<NotificationSection> {

  final ScrollController _scrollController = ScrollController();

  late NotificationBloc notificationBloc;

  @override
  void initState() {
    notificationBloc = BlocProvider.of<NotificationBloc>(context);
    notificationBloc.add(FetchNotificationData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:
        const EdgeInsets.only(top: Spacing.space40, right: Spacing.space56),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: Spacing.space32),
                      child: Text(
                        'NOTIFICATIONS',
                        style: context.textTheme.h1,
                      ),
                    )),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: const Icon(Icons.menu),
                  ),
                ),
              ],
            ),
            Expanded(

              child: BlocBuilder<NotificationBloc,NotificationState>(

                builder: (context,state) {

                  Widget widget = const SizedBox();

                  if(state is FetchingState){
                    widget = Center(child: CircularProgressIndicator(color: context.colorScheme.primaryColor,),);
                  }
                  else if(state is FetchedState){

                    widget = ListView.builder(
                        padding: const EdgeInsets.only(top: Spacing.space8),
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) => NotificationRow(
                          notificationData: state.notifications[index],
                        ));
                  }
                  else if(state is ErrorState){

                    widget = Center(child: Text(state.message,style: context.textTheme.h2,),);
                  }

                  return widget;
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

}
