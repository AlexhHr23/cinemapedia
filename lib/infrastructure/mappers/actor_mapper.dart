
import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credist_response.dart';

class ActorMapper {

  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null 
    ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
    : 'https://c8.alamy.com/zooms/9/abf223b338c74a21954c2c09afeebf8a/pdycc8.jpg',
    character: cast.character,
  );
}