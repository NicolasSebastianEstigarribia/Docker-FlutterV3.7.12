import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/widgets/network_image.dart';

class AnimateListView extends StatefulWidget {
  final List<Search> movies;

  const AnimateListView({super.key, required this.movies});

  @override
  _AnimateListViewState createState() => _AnimateListViewState();
}

class _AnimateListViewState extends State<AnimateListView> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);

  int _activeIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _activeIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Alignment _getAlignmentForIndex(int index) {
    if (index == 0) {
      // Primera imagen con recorte en la parte derecha
      return Alignment.centerRight;
    } else if (index == widget.movies.length - 1) {
      // Última imagen con recorte en la parte izquierda
      return Alignment.centerLeft;
    } else {
      // Imagen en el medio sin recorte
      return Alignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: PNetworkImage(
            widget.movies[index].poster!,
            fit: BoxFit.fill,
            alignment: _getAlignmentForIndex(index),
          ),
        );
      },
      onPageChanged: (int index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
