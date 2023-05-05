import 'package:flutter/material.dart';
import 'package:movie_admin/views/movie_list.dart';


class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {


  @override
  Widget build(BuildContext context) {
    return MovieList();
  }

}