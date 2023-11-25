import 'package:get/get.dart';
import 'package:the_movie_getx/data/route_app.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_binding.dart';
import 'package:the_movie_getx/data/screen/search/search_binding.dart';
import 'package:the_movie_getx/data/screen/search/search_screen.dart';

import '../screen/home/home_binding.dart';
import '../screen/home/home_screen.dart';
import '../screen/movie_detail/movie_detail_screen.dart';

part 'app_routes.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: Routes.routeApp, page: () => const RouteApp()),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => const MovieDetailScreen(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
  ];
}
