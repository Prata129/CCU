// ignore_for_file: prefer_const_constructors

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:revio/ui/libraryScreen.dart';
import 'package:revio/ui/eventsHomePage.dart';
import 'package:revio/ui/homeScreen.dart';
import 'package:revio/ui/DiscoverScreen.dart';
import 'package:revio/ui/profile/Profile_View.dart';
import 'package:revio/ui/ArtistHomeScreen.dart';

class Manager extends StatefulWidget {
  @override
  _Manager createState() => _Manager();
}

class _Manager extends State<Manager> {
  int _currentIndex = 2;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Color.fromARGB(255, 83, 83, 83), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0xFF222222),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      LibraryScreen(),
      DiscoverScreen(),
      ArtistHomeScreen(),
      EventsHomePage(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.library_music),
        title: ("Library"),
        activeColorPrimary: Color.fromARGB(255, 229, 189, 88),
        inactiveColorPrimary: Color.fromARGB(255, 255, 255, 255),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_rounded),
        title: ("Discover"),
        activeColorPrimary: Color.fromARGB(255, 229, 189, 88),
        inactiveColorPrimary: Color.fromARGB(255, 255, 255, 255),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Color.fromARGB(255, 229, 189, 88),
        inactiveColorPrimary: Color.fromARGB(255, 255, 255, 255),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.event),
        title: ("Events"),
        activeColorPrimary: Color.fromARGB(255, 229, 189, 88),
        inactiveColorPrimary: Color.fromARGB(255, 255, 255, 255),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Color.fromARGB(255, 229, 189, 88),
        inactiveColorPrimary: Color.fromARGB(255, 255, 255, 255),
      ),
    ];
  }
  /* @override
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
              ProfileView(),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
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
  } */
}
