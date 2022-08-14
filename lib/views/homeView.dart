// ignore_for_file: file_names
import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:arcore_example/views/objectsOnPlanes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ObjectsOnPlanesWidget()));
              },
              child: const Text("Try Product")),
        ),
        bottomNavigationBar: const GNav(gap: 8, tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.category,
            text: 'Categories',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ]));
  }
}
