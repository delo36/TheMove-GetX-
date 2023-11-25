import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:the_movie_getx/data/screen/movie_detail/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings{
@override
void dependencies() {
  Get.lazyPut<MovieDetailController>(() => MovieDetailController());
}

}