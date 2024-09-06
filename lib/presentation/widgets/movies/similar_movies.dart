

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {

  final movieRepository = ref.watch(movieRepositoryProvider);

  return movieRepository.getSimilarMovies(movieId);

});

class SimiliarMovies extends ConsumerWidget {

  final int movieId;

  const SimiliarMovies({super.key, required this.movieId, });

  @override
  Widget build(BuildContext context, ref) {

    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));
    

    return similarMoviesFuture.when(
      data: (movies) => _Recomendations(movies: movies), 
      error: (_,__) => const Center(child: Text('No se pudo cargar la película')), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2))
    );
  }
}

class _Recomendations extends StatelessWidget {

  final List<Movie> movies;

  const _Recomendations({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50),
      child: MovieHorizontalListView(
        title: 'Recomendaciones',
        movies: movies,
        subtitle: 'Para ti',
      ),
    );
  }
}