import 'package:flutter/cupertino.dart';

class BottomNavigationItemData {

  final Function() onClick;
  final IconData icon;
  final String name;
  final bool selected;

  BottomNavigationItemData({required this.onClick, required this.icon, required this.name, required this.selected});

}