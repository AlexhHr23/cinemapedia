import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


import '../../views/views.dart';

class HomeScreen extends StatelessWidget {

  final int pageIndex;

  static const name = 'home-screen';

  const HomeScreen({
    super.key, 
    required this.pageIndex
  });

  final viewRoutes = const <Widget> [
    HomeView(),
    PopularView(),// <----- Categorias view
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex)
    );
  }
}

