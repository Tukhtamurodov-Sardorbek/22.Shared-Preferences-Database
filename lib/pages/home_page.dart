import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedpreferencesdb/pages/home_assignment1.dart';
import 'package:sharedpreferencesdb/pages/optimized_version.dart';
import 'package:sharedpreferencesdb/pages/simple_version.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SimpleVersion(),
          const OptimizedVersion(),
          const HomeAssignmentOne(),
          Container(
            color: Colors.green,
          )
        ],
        onPageChanged: (index){
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one)),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two)),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3)),
          BottomNavigationBarItem(icon: Icon(Icons.looks_4)),
        ],
        currentIndex: _index,
        onTap: (index){
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

}
