// ignore_for_file: file_names, unused_import
import 'package:flutter/services.dart';
import 'package:laba/constants.dart';
import 'package:laba/views/details/components/body.dart';
import 'package:laba/views/localAndWebObjectsView.dart';
import 'package:laba/views/objectsOnPlanes.dart';
import 'package:laba/views/product/productsScreen.dart';
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
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ObjectsOnPlanesWidget()));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 25),
            elevation: 5,
          ),
          icon: const Icon(
            Icons.arrow_forward,
            size: 50,
          ),
          label: const Text("Try a product"),
        ),
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        curve: Curves.easeInCirc,
        backgroundColor: kPrimaryColor,
        color: Colors.white,
        activeColor: Colors.white,
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
            iconSize: 35,
          ),
          GButton(
            icon: Icons.lightbulb,
            text: 'User Guide',
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserGuide()),
              );
            },
          ),
          GButton(
            icon: Icons.exit_to_app,
            text: 'Exit',
            iconSize: 35,
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

class UserGuide extends StatelessWidget {
  const UserGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Guide')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back!'),
      )),
    );
  }
}
