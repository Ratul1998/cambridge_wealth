import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/material.dart';

import '../models/bottom_navigation_item_data.dart';
import '../webpages/side_navigation_item.dart';

class SideNavigationBar extends StatefulWidget {
  final Function callback;
  final int selectedIndex;
  const SideNavigationBar(
      {Key? key, required this.callback, required this.selectedIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SideNavigationBarState();
}

class SideNavigationBarState extends State<SideNavigationBar> {
  List<NavigationButtonData> actions = [
    NavigationButtonData(
      icon: Icons.home,
      name: 'Home',
    ),
    NavigationButtonData(
      icon: Icons.settings,
      name: 'Settings',
    )
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
          SideNavigationItem(
            navigationButtonData: actions[0],
            onClick: () {
              widget.callback(0);
            },
            selected: widget.selectedIndex == 0,
          ),
          SideNavigationItem(
            navigationButtonData: actions[1],
            onClick: () {
              widget.callback(1);
            },
            selected: widget.selectedIndex == 1,
          ),
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
