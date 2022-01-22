// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:revio/ui/libraryScreen.dart';
import 'package:revio/ui/eventsHomePage.dart';
import 'package:revio/ui/homeScreen.dart';
import 'package:revio/ui/DiscoverScreen.dart';

class Manager extends StatefulWidget {
  @override
  _Manager createState() => _Manager();
}

class _Manager extends State<Manager> {
  int _currentIndex = 2;
  PageController pageController = PageController(
    initialPage: 2,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              LibraryScreen(),
              DiscoverScreen(),
              HomeScreen(),
              EventsHomePage(),
            ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Color.fromARGB(255, 83, 83, 83),
          selectedItemColor: Color.fromARGB(255, 229, 189, 88),
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Events',
            ),
            /* BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ), */
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            pageController.jumpToPage(index);
          },
        ));
  }

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('row $index'),
        );
      },
    );
  }
}
