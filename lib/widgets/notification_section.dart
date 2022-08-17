import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/notification_data.dart';
import 'notification_row.dart';

class NotificationSection extends StatelessWidget {
  NotificationSection({Key? key}) : super(key: key);

  final List<NotificationData> notifications = [
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
    NotificationData(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis',
        iconPath: 'assets/images/common.png',
        seen: false),
  ];

  final ScrollController _scrollController = ScrollController();

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
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: Spacing.space8),
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  itemBuilder: (context, index) => NotificationRow(
                        notificationData: notifications[index],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
