import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository{

  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavorute(int movie);

  Future <List<Movie>> loadMovies({int limit = 10, offset = 0});
  
}