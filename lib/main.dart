import 'package:coffeebook/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffeeCarousel/coffeeCarousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;
  final _pages = [
    CoffeeCarousel(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coffeeBook',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          selectedItemColor: Colors.brown,
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
    );
  }
}
