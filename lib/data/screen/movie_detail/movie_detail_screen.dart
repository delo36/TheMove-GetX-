import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie_getx/data/screen/movie_detail/components/movie_detail_greeting_widget.dart';
import 'package:the_movie_getx/data/screen/movie_detail/components/similar_movie_widget.dart';

import '../home/components/greeting_widget.dart';
import 'components/actor_widget.dart';
import 'components/movie_info_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailGreetingWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  MovieInfoWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  ActorWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  SimilarMovieWidget()
                ],
              ),
            )));
  }
}
