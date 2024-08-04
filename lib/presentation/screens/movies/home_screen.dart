import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesView(),
      bottomNavigationBar: CustomBottomNavigation()
    );
  }
}

