import 'package:flutter/material.dart';
import 'dart:ui';
import 'screen/welcomescreen.dart';
import 'screen/home_screen.dart';
import 'screen/stats_screen.dart' hide HexagonClipper;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ویجت مرکزی برای مدیریت نوار پایین و سوئیچ بین صفحات
class MainScreenWrapper extends StatefulWidget {
  @override
  _MainScreenWrapperState createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StatsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'NFT Marketplace' : 'Stats',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF211134),
        elevation: 0,
        centerTitle: true,
        actions: _selectedIndex == 1
            ? [
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ]
            : null,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 90.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4B0082).withOpacity(0.4),
                    Color(0xFF8A2BE2).withOpacity(0.4),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                notchMargin: 10.0,
                shape: CircularNotchedRectangle(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/Home.png',
                            width: 39.64, height: 39.64),
                        onPressed: () => _onItemTapped(0),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/Symbol.png',
                            width: 39.64, height: 39.64),
                        onPressed: () => _onItemTapped(1),
                      ),
                      SizedBox(width: 60.0),
                      IconButton(
                        icon: Image.asset('assets/images/Explore.png',
                            width: 39.64, height: 39.64),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/More.png',
                            width: 39.64, height: 39.64),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 70.0,
        height: 70.0,
        child: ClipPath(
          clipper: HexagonClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE0BBE4).withOpacity(0.6),
                  Color(0xFF957DAD).withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
