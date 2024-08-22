
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key, });

  @override
  FavoritesViewState createState() => FavoritesViewState();
}


class FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvier.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context,) {

    final favoriteMovies = ref.watch(favoriteMoviesProvier).values.toList();
    
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {

          final movie = favoriteMovies[index];
          
          return ListTile(
            title: Text(movie.title)
          );
        },
      ),
    );
  }
}