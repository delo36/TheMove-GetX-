import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_controller.dart';
import 'package:the_movie_getx/data/utils/Constants.dart';

class SimilarMovieWidget extends StatelessWidget {
  const SimilarMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(builder: (controller) {
      return Obx(() {
        return    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Similar Movies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 23),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  height: 210,
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: controller.similarMovieList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    color: Colors.black,
                                    child: Image.network(
                                      controller.similarMovieList[index].backDropPath != ""
                                          ? "${Constants.imagePath}${controller.similarMovieList[index].backDropPath}"
                                          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZoruPaXTHD4lV3bzxzzUGYYgyiephlSjkInd6HC9MnPDSy97SCPGQSpaFV_-A1OSMK0&usqp=CAU',                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  controller.similarMovieList[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis,

                                    color: Colors.white,

                                  ),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                RatingBar.builder(
                                  itemSize: 13,
                                  initialRating: controller.similarMovieList[index].voteAverage /2,
                                  tapOnlyMode: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                  onRatingUpdate: (onRatingUpdate) {
                                    print("Hello");
                                  },
                                ),
                              ],
                            )
                        );
                      })),
            ],
          ),
        );
      });
    });
  }
}
