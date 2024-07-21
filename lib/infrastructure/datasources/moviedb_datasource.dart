import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.movieDbKey,
      'language': 'es-MX'
    }
  ));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response = await dio.get('/movie/now_playing');

    final movieDbResponse  =  MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMaper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }



}