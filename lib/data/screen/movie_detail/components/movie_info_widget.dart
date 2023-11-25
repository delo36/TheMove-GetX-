import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_controller.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(builder: (controller) {
      return Obx(() => controller.isLoading.value?
       const Center(child: CircularProgressIndicator(backgroundColor: Colors.grey,color: Colors.amber,),):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.selectedMovie.value.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26)),
                const SizedBox(
                  width: 10,
                ),
                Text(controller.selectedMovie.value.releaseDate,
                    style:
                    const TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RatingBar.builder(
                itemSize: 20,
                initialRating: controller.selectedMovie.value.voteAverage / 2,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
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
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              color: Colors.black,
              height: 60,
              child: ListView.builder(
                  itemCount: controller.selectedMovie.value.genres.length,
                  padding: const EdgeInsets.only(left: 12),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          controller.selectedMovie.value.genres[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  })),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Story Line",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  controller.selectedMovie.value.overview,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 100,
                )
              ],
            ),
          )
        ],
      )
    );
    });
  }
}
