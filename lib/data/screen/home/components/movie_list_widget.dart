import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/home/home_controller.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.black,
                  height: 60,
                  child: ListView.builder(
                      itemCount: controller.movieCategoryList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.fetchMovieCategory(
                                controller.movieCategoryList[index]);
                            controller.setSelectedMovieCategoryIndex(index);

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 140,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: controller.selectedMovieCategoryIndex == index
                                      ? Colors.amber// Change color when selected
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Text(
                                controller.movieCategoryList[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      })),
            ));
  }
}
