import 'package:flutter/material.dart';
import 'package:movies/home/tabs/browse_tab/browse_tab.dart';
import 'package:movies/home/tabs/home_tab/home_tab.dart';
import 'package:movies/home/tabs/profile_tab/profile_tab.dart';
import 'package:movies/home/tabs/search_tab/search_tab.dart';
import 'package:movies/home/widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[selectedIndex],
      bottomSheet: CustomBottomNavBar(
        selectedIndex: selectedIndex, onIconSelected: (index) {
        selectedIndex = index;
        setState(() {});
      },),
    );
  }
}