import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:the_movie_getx/data/screen/home/home_screen.dart';

import 'components/body_widget.dart';
import 'components/bottom_navigatioin_bar_widget.dart';

class RouteApp extends StatefulWidget {
  const RouteApp({super.key});

  @override
  State<RouteApp> createState() => _RouteAppState();
}

class _RouteAppState extends State<RouteApp> {

  int pageIndex = 0;
  List<IconData> iconItems = [
    MaterialCommunityIcons.home,
    MaterialCommunityIcons.movie,
    MaterialCommunityIcons.heart,

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BodyWidget(pageIndex: pageIndex),
      bottomNavigationBar: BottomNavigationBarWidget(
        pageIndex: pageIndex,
        iconItems: iconItems,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),

    );
  }
}



