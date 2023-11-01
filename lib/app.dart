import 'package:flutter/material.dart';
import 'package:mapz/views/start_page.dart';
import 'package:mapz/views/stats_page.dart';
import 'package:mapz/views/profile_page.dart';
import 'package:mapz/views/map_page.dart';

//instialisierung Mapzs App
class Mapz extends StatelessWidget {
  const Mapz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigationWrapper(),
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}

//NavigationWarpper

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_activity),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.group),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
          child: <Widget>[
        const StartPage(),
        const MapPage(),
        const StatsPagewithlist(),
        const ProfilePage(),
      ][currentPageIndex]),
    );
  }
}
