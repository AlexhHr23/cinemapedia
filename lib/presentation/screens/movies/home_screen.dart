import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
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

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomigMovies = ref.watch(upcomingMoviesProvider);

    return const FullScreenLoader();

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
