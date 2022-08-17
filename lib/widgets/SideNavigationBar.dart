import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bottom_navigation_item_data.dart';
import '../webpages/side_navigation_item.dart';

class SideNavigationBar extends StatefulWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SideNavigationBarState();
}

class SideNavigationBarState extends State<SideNavigationBar> {
  List<NavigationButtonData> actions = [
    NavigationButtonData(
        onClick: () {}, icon: Icons.home, name: 'Home', selected: true),
    NavigationButtonData(
        onClick: () {}, icon: Icons.settings, name: 'Settings', selected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            margin: const EdgeInsets.all(Spacing.space12)
                .copyWith(bottom: Spacing.space64),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/images/applogo.png'),
                    fit: BoxFit.cover,
                    scale: 0.1)),
          ),
          ...actions
              .map((e) => SideNavigationItem(navigationButtonData: e))
              .toList(),
          const Expanded(child: SizedBox()),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 56),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
