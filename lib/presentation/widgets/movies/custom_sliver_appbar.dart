
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBarr extends StatelessWidget {
  final Movie movie;

  const CustomSliverAppBarr({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {},
            //icon: Icon(Icons.favorite_border)
            icon: Icon(Icons.favorite_rounded, color: Colors.white))
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // title: Text(
        //   movie.title,
        //   style: const TextStyle(fontSize: 20, color: Colors.white),
        //   textAlign: TextAlign.start,
        // ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const _CustomGradiend(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2], 
              colors: [Colors.black54, Colors.transparent]
            ),
            const _CustomGradiend(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter,
              stops: [0.8, 1.0],
              colors: [
               Colors.transparent,
                Colors.black54,
              ]
            ),
            const _CustomGradiend(
              begin: Alignment.topLeft,
              stops: [0.0, 0.3], 
              colors: [
                Colors.black87,
                Colors.transparent,
              ]
            )
          ],
        ),
      ),
    );
  }
}

class _CustomGradiend extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradiend({

      this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight,
      required this.stops,
      required this.colors
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                stops: stops, 
                colors: colors
    ))),
    );
  }
}
