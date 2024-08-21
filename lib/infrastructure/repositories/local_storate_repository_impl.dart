
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorateRepositoryImpl extends LocalStorageRepository{

  final LocalStorageDatasource datasource;

  LocalStorateRepositoryImpl({required this.datasource});

  @override
  Future<bool> isMovieFavorute(int movie) {
    return datasource.isMovieFavorite(movie);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }

}