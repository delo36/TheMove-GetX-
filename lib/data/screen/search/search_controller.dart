import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/movie_model.dart';
import '../../network/api_service.dart';

class MovieSearchController extends GetxController {
  static MovieSearchController get to => Get.find();

  final ApiService _apiService = ApiService();

  RxBool isLoading = true.obs;
  int selectedMovieCategoryIndex = 0;
  final movieList = <MovieModel>[].obs;

  void onSearchTextChanged(String newText) {
    fetchMovieDataField(newText);
  }

  void fetchMovieDataField(String movieData) {
    fetchData();
    fetchMovieData(_apiService.searchMovie(movieData));
  }

  void fetchData() async {
    isLoading(true); // Set loading to true

    // Simulate a data fetch or processing task
    await Future.delayed(const Duration(seconds: 2));

    // Once the task is completed, set loading to false
    isLoading(false);
  }

  Future<void> fetchMovieData(Future<List<MovieModel>> movieType) async {
    try {
      final movies = await movieType;

      movieList.assignAll(movies);
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}
