import 'package:first_screen/src/features/loginScreens/splash_screen.dart';
import 'package:first_screen/src/features/posten/presentation/pages/add_post_page.dart';
import 'package:first_screen/src/features/posten/presentation/pages/home_page.dart';
import 'package:first_screen/src/features/posten/presentation/pages/notification_page.dart';
import 'package:first_screen/src/features/posten/presentation/pages/profil_page.dart';
import 'package:first_screen/src/features/posten/presentation/pages/search_page.dart';

import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _MainAppState();
}

class _MainAppState extends State<Navigation> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    NotificationPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 10),
        body: _pages[_currentIndex],
        bottomNavigationBar: customBottomNavgigationBar(),
      ),
    );
  }

  BottomNavigationBar customBottomNavgigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Suche'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Beitrag'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Benachrichtigungen',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StyleSphere',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
