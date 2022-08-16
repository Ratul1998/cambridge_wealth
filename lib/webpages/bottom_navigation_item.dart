import 'package:cambridge_wealth/models/bottom_navigation_item_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final BottomNavigationItemData bottomNavigationItemData;

  const BottomNavigationButton(
      {Key? key, required this.bottomNavigationItemData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: bottomNavigationItemData.onClick,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: Icon(
              bottomNavigationItemData.icon,
              color: bottomNavigationItemData.selected
                  ? Colors.amber
                  : Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              bottomNavigationItemData.name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: bottomNavigationItemData.selected
                      ? Colors.amber
                      : Colors.white),
            ),
          ),
          Visibility(
            visible: bottomNavigationItemData.selected,
            child: Container(
              height: 10,
              width: 20,
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
