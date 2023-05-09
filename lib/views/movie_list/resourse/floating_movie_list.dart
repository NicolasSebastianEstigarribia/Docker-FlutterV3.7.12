import 'package:flutter/material.dart';

class FloatingMovieList extends StatefulWidget {
  const FloatingMovieList({
    super.key,
  });

  @override
  State<FloatingMovieList> createState() => _FloatingMovieListState();
}

class _FloatingMovieListState extends State<FloatingMovieList> {
  @override
  Widget build(BuildContext context) {
    bool insert = false;

    return FloatingActionButton(
      onPressed: () {
        setState(() {
          insert = true;
        });
      },
      child: !insert ? Icon(Icons.add) : Icon(Icons.save),
    );
  }
}
