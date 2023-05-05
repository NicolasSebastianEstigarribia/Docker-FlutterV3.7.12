import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/widgets/network_image.dart';

class CardMovieSearch extends StatelessWidget {
  final Search item;

  const CardMovieSearch({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          PNetworkImage(
            item.poster!,
            height: 250,
            width: 167,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom:
                0, // Alinear el contenido del container en la parte inferior
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  item.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
