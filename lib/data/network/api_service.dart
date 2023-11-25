import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_movie_getx/data/models/cast_model.dart';
import 'package:the_movie_getx/data/models/token_model.dart';

import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/session_model.dart';
import '../utils/Constants.dart';

class ApiService {
  static const String _nowPlayingUrl =
      "${Constants.baseUrl}/movie/now_playing?api_key=${Constants.apiKey}";
  static const String _topRatedUrl =
      "${Constants.baseUrl}/movie/top_rated?api_key=${Constants.apiKey}";
  static const String _upComingUrl =
      "${Constants.baseUrl}/movie/upcoming?api_key=${Constants.apiKey}";
  static const String _popularUrl =
      "${Constants.baseUrl}/movie/popular?api_key=${Constants.apiKey}";

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    String movieDetailUrl =
        "${Constants.baseUrl}/movie/$movieId?api_key=${Constants.apiKey}";
    final response = await http.get(Uri.parse(movieDetailUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body);
      return MovieDetailModel.fromJson(decodeData);
    } else {
      ("Fail");
      throw Exception("Something wrong");
    }
  }

  Future<List<MovieModel>> searchMovie(String movieData) async {
    String searchMovie =
        "${Constants.baseUrl}/search/movie?query=$movieData&api_key=${Constants.apiKey}";
    final response = await http.get(Uri.parse(searchMovie));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      print(Error);
      throw Exception("Something wrong");
    }
  }

  Future<List<CastModel>> getCastList(int movieId) async {
    String castListUrl =
        "${Constants.baseUrl}/movie/$movieId/credits?api_key=${Constants.apiKey}";
    final response = await http.get(Uri.parse(castListUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['cast'] as List;
      return decodeData.map((movie) => CastModel.fromJson(movie)).toList();
    } else {
      print(Error);
      throw Exception("Something wrong");
    }
  }

  Future<List<MovieModel>> getSimilarMovieList(int movieId) async {
    String searchMovie =
        "${Constants.baseUrl}/movie/$movieId/similar?api_key=${Constants.apiKey}";
    final response = await http.get(Uri.parse(searchMovie));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      print(Error);
      throw Exception("Something wrong");
    }
  }


}
