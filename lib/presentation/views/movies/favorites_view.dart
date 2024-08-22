
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {

  final VoidCallback? loadNextPage;

  const FavoritesView({super.key, this.loadNextPage,});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

bool isLastPage = false;
bool isLoading = false;

class FavoritesViewState extends ConsumerState<FavoritesView> {



  @override
  void initState() {

    loadNextPage();
  }


  void loadNextPage() async {

    if(isLoading || isLastPage) return;
    isLoading = true;

    final movies = await ref.read(favoriteMoviesProvier.notifier).loadNextPage();
    isLoading = false;

    if(movies.isEmpty) {
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context,) {

    final favoriteMovies = ref.watch(favoriteMoviesProvier).values.toList();
    
    return MovieMasonry(
      loadNextPage: loadNextPage,
      movies: favoriteMovies
    );
  }
}