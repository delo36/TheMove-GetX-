import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_controller.dart';
import 'package:the_movie_getx/data/utils/Constants.dart';

class ActorWidget extends StatelessWidget {
  const ActorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(builder: (controller) {
      return Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Actors",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 23),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  height: 200,
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: controller.castList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8)),
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  color: Colors.black,
                                  child: Image.network(
                                    '${Constants.imagePath}${controller.castList[index].profilePath}',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.black.withOpacity(
                                      0.5), // Set the transparency here
                                  child: Text(
                                    controller.castList[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })),
            ],
          ),
        );
      });
    });
  }
}
