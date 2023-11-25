import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:icons_flutter/icons_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int pageIndex;
  final List<IconData> iconItems;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.pageIndex,
    required this.iconItems,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: Colors.amber,
      activeIndex: pageIndex,
      splashColor: Colors.grey,
      inactiveColor: Colors.grey,
      notchSmoothness: NotchSmoothness.softEdge,
      gapLocation: GapLocation.none,
      backgroundColor: Colors.black,
      onTap: onTap,
    );
  }
}
