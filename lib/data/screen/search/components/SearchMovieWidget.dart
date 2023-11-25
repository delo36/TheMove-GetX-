import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie_getx/data/screen/home/home_controller.dart';
import 'package:the_movie_getx/data/screen/search/search_controller.dart';

import '../../../models/movie_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/Constants.dart';
import '../../movie_detail/movie_detail_screen.dart';

class SearchMoviesWidget extends StatelessWidget {
  const SearchMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieSearchController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Obx(() => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.amber,
                      ),
                    ) // Show loading indicator
                  : SizedBox(
                      height: Get.height,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.66,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.movieList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          MovieModel movie = controller.movieList[index];
                          return GestureDetector(
                            onTap: () {
                              //Get.toNamed(Routes.movieDetail, arguments: movie);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: Get.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        topLeft: Radius.circular(16),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        movie.backDropPath != ""
                                            ? "${Constants.imagePath}${movie.backDropPath}"
                                            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZoruPaXTHD4lV3bzxzzUGYYgyiephlSjkInd6HC9MnPDSy97SCPGQSpaFV_-A1OSMK0&usqp=CAU',
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "(${movie.releaseDate})",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        RatingBar.builder(
                                          itemSize: 13,
                                          initialRating: movie.voteAverage / 2,
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
                                        Text(
                                          movie.overview,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white54,
                                            fontSize: 11,
                                          ),
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
            ));
  }
}
