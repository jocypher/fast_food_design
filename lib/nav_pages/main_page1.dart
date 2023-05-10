import 'package:fast_food_app_design/nav_pages/personal_page_account.dart';
import 'package:fast_food_app_design/nav_pages/history.dart';
import 'package:fast_food_app_design/nav_pages/search_page.dart';
import 'package:fast_food_app_design/pages/homepage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    const HomePage(),
    const SearchPage(),
    const HistoryPage(),
    const MyPage(),

  ];

  int currentIndex= 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const [
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}

