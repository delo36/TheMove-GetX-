import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/home/components/home_movies_widget.dart';
import 'package:the_movie_getx/data/screen/search/components/SearchMovieWidget.dart';
import 'package:the_movie_getx/data/screen/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieSearchController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
          title: const Text(
            "Finder",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                controller.onSearchTextChanged(value);
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black, // Change the color to your desired color
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    controller.onSearchTextChanged('');
                  },
                ),// Icon at the start
              ),
            ),

          ),
        ),
        body: const SearchMoviesWidget(),
      ),
    );
  }
}
