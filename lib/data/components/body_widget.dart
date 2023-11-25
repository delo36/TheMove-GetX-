import 'package:flutter/material.dart';

import '../screen/home/home_screen.dart';
class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      alignment: Alignment.center,
      index: pageIndex,
      children: const [

        HomeScreen(),
        Center(
          child: Text("Movie Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Center(
          child: Text("Favorite Pge",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),



      ],
    );
  }
}