import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_controller.dart';
import 'package:the_movie_getx/data/utils/Constants.dart';

class MovieDetailGreetingWidget extends StatelessWidget {
  const MovieDetailGreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(builder: (controller) {
      return Obx(() {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              child: Container(
                height: 300,
                color: Colors.black,
                width: Get.width,
                child: Image.network(
                  controller.selectedMovie.value.backDropPath != ""
                      ? "${Constants.imagePath}${controller.selectedMovie.value.backDropPath}"
                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZoruPaXTHD4lV3bzxzzUGYYgyiephlSjkInd6HC9MnPDSy97SCPGQSpaFV_-A1OSMK0&usqp=CAU',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 5,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                )),
            Positioned(
                top: 5,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      )),
                ))
          ],
        );
      });
    });
  }
}
