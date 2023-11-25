import 'package:get/get.dart';
import 'package:the_movie_getx/data/models/session_model.dart';
import 'package:the_movie_getx/data/models/token_model.dart';

import '../../models/cast_model.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import '../../network/api_service.dart';

class MovieDetailController extends GetxController {
  static MovieDetailController get to => Get.find();

  final ApiService _apiService = ApiService();
  final Rx<MovieDetailModel> selectedMovie = MovieDetailModel(
      id: 0,
      title: '',
      backDropPath: '',
      originalTitle: '',
      overview: '',
      posterPath: '',
      releaseDate: '',
      voteAverage: 0.0,
      genres: []).obs;

  final Rx<TokenModel> token =
      TokenModel(success: false, expiresAt: "", requestToken: "").obs;
  final Rx<SessionModel> session =
      SessionModel(success: false, guestSessionId: "", expiresAt: "").obs;

  RxBool isLoading = true.obs;
  final castList = <CastModel>[].obs;
  final similarMovieList = <MovieModel>[].obs;

  late MovieModel movieModel = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
    fetchMovieDetail(movieModel.id);
    fetchCastList(movieModel.id);
    fetchSimilarMovieList(movieModel.id);
  }

  void fetchData() async {
    isLoading(true); // Set loading to true

    // Simulate a data fetch or processing task
    await Future.delayed(const Duration(seconds: 2));

    // Once the task is completed, set loading to false
    isLoading(false);
  }

  void fetchMovieDetail(int movieId) async {
    selectedMovie.value = await _apiService.getMovieDetail(movieId);
  }

  void fetchCastList(int movieId) async {
    castList.assignAll(await _apiService.getCastList(movieId));
  }

  void fetchSimilarMovieList(int movieId) async {
    similarMovieList.assignAll(await _apiService.getSimilarMovieList(movieId));
  }
}
