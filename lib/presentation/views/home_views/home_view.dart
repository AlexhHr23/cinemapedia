import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/movies/inital_loading_provider.dart';
import '../../providers/movies/movies_providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initalLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomigMovies = ref.watch(upcomingMoviesProvider);


    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
        children: [
      
          //const CustomAppbar(),
      
          MoviesSlideshow(movies: slideShowMovies),
      
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
            
          ),
          MovieHorizontalListView(
            movies: popularMovies,
            title: 'Populares',
            subtitle: 'En este mes',
            loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage()
            
          ),
          MovieHorizontalListView(
            movies: topRatedMovies,
            title: 'Mejor valoradas',
            subtitle: 'Mejores',
            loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage()
            
          ),
          MovieHorizontalListView(
            movies: upcomigMovies,
            title: 'En cámino',
            subtitle: 'Proximamente',
            loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage()
            
          ),

          const SizedBox(height: 10)
        ],
      );
          },
          childCount: 1
        )),
      ], 
    );
  }
}
