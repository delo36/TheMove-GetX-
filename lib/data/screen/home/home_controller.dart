import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_movie_getx/data/models/cast_model.dart';
import 'package:the_movie_getx/data/network/api_service.dart';

import '../../models/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final ApiService _apiService = ApiService();

  RxBool isLoading = true.obs;
  int selectedMovieCategoryIndex = 0;
  final movieList = <MovieModel>[].obs;
  List<String> movieCategoryList = [
    'Popular',
    'Now Playing',
    "Upcoming",
    "Top Rated"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
    fetchMovieData(_apiService.getPopularMovies());
  }

  void setSelectedMovieCategoryIndex(int index) {
    selectedMovieCategoryIndex = index;
    update(); // This triggers a rebuild of the widget
  }
  void fetchMovieCategory(String name) {
    fetchData();

    switch (name) {
      case "Popular":
        fetchMovieData(_apiService.getPopularMovies());
        break;
      case "Now Playing":
        fetchMovieData(_apiService.getNowPlayingMovies());
        break;
      case "Upcoming":
        fetchMovieData(_apiService.getUpcomingMovies());
        break;
      default:
        fetchMovieData(_apiService.getTopRatedMovies());
        break;
    }
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
