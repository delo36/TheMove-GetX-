part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const routeApp = _Paths.routeApp;
  static const home = _Paths.home;
  static const movieDetail = _Paths.movieDetail;
  static const search = _Paths.search;
}

abstract class _Paths {
  static const routeApp = '/routeApp';
  static const home = '/home';
  static const movieDetail = '/movieDetail';
  static const search = '/search';
}
