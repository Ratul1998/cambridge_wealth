import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bottom_navigation_item_data.dart';

class SideNavigationItem extends StatelessWidget{

  final NavigationButtonData navigationButtonData;

  const SideNavigationItem(
      {Key? key, required this.navigationButtonData})
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
                        ? Colors.amber
                        : Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    navigationButtonData.name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: navigationButtonData.selected
                            ? Colors.amber
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }


}