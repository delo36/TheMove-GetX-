import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/search/search_screen.dart';

import '../../../routes/app_pages.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: false,
      title: const Text(
        "Watch Now",
        style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white, fontSize: 28),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.search);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ],
    );
  }
}
