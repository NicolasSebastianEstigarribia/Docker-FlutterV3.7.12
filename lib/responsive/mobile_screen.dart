import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/utils/globals.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  CupertinoTabBar bottomNavBar() {
    return CupertinoTabBar(
      backgroundColor: mobileBackgroundColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: (_page == 0) ? primaryColor : secondaryColor,
          ),
          label: '',
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (_page == 1) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: (_page == 2) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: (_page == 3) ? primaryColor : secondaryColor,
          ),
          label: '',
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: (_page == 4) ? primaryColor : secondaryColor,
          ),
          label: '',
          backgroundColor: primaryColor,
        ),
      ],
      onTap: navigationTapped,
      currentIndex: _page,
    );
  }
}