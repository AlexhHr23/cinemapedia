

import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credist_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  
    final dio = Dio(BaseOptions(
      baseUrl: Enviroment.baseUrl,
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': 'es-MX'
      }
    )
    );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get(
      '/movie/$movieId/credits'
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
      ).toList();


    return actors;

  }

}