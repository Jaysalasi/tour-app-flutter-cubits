import 'package:flutter/material.dart';
import 'package:tourism/pages/nav_pages/bar_item_page.dart';
import 'package:tourism/pages/nav_pages/homepage.dart';
import 'package:tourism/pages/nav_pages/my_page.dart';
import 'package:tourism/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(
            0.5,
          ),
          onTap: onTap,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.apps,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(
                Icons.bar_chart,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: 'User',
              icon: Icon(
                Icons.person,
              ),
            ),
          ]),
    );
  }
}
