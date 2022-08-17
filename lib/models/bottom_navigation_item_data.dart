import 'package:flutter/cupertino.dart';

class NavigationButtonData {
  final Function() onClick;
  final IconData icon;
  final String name;
  final bool selected;

  NavigationButtonData(
      {required this.onClick,
      required this.icon,
      required this.name,
      required this.selected});
}
