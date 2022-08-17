import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/material.dart';

import '../models/bottom_navigation_item_data.dart';

class SideNavigationItem extends StatelessWidget {
  final NavigationButtonData navigationButtonData;

  const SideNavigationItem({Key? key, required this.navigationButtonData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigationButtonData.onClick,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 8),
                  child: Icon(
                    navigationButtonData.icon,
                    color: navigationButtonData.selected
                        ? context.colorScheme.primaryColor
                        : Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    navigationButtonData.name,
                    style: context.textTheme.body1Medium.copyWith(
                        color: navigationButtonData.selected
                            ? context.colorScheme.primaryColor
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: navigationButtonData.selected,
            child: Container(
              height: 80,
              width: 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: context.colorScheme.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
