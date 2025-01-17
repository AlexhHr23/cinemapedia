
import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actors.dart';
import '../../domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {

    return datasource.getActorsByMovie(movieId);

  }

}