import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:nft/screen/stats_screen.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60) * (3.1415926535 / 180);
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    _HomeContent(),
    StatsScreen(),
    Center(
        child: Text('Search Screen Content',
            style: TextStyle(color: Colors.white))),
    Center(
        child: Text('Profile Screen Content',
            style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar حذف شده تا نوار آیفون نمایش داده شود
      appBar: _selectedIndex == 1
          ? null
          : null, // هیچ AppBar برای Home و Stats نیست
      body: Container(
        color: Color(0xFF211134),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      extendBody: true,
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
              child: Stack(
                children: [
                  BottomAppBar(
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
                            icon: Image.asset(
                              'assets/images/Home.png',
                              width: 39.64,
                              height: 39.64,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _onItemTapped(0);
                            },
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/Symbol.png',
                              width: 39.64,
                              height: 39.64,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _onItemTapped(1);
                            },
                          ),
                          SizedBox(width: 60.0),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/Explore.png',
                              width: 39.64,
                              height: 39.64,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _onItemTapped(2);
                            },
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/More.png',
                              width: 39.64,
                              height: 39.64,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _onItemTapped(3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 134,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                    ),
                  ),
                ],
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
            width: 70.0,
            height: 70.0,
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
              onPressed: () {
                print('Floating Action Button pressed!');
              },
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

  static Widget _HomeContent() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نوار آیفون بالا
          Image.asset(
            'assets/images/iPhone.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              'NFT Marketplace',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildCoverCard(
                  imagePath: 'assets/images/cover1.jpg',
                  category: 'Abstract',
                ),
                SizedBox(width: 9.01),
                _buildCoverCard(
                  imagePath: 'assets/images/cover2.jpg',
                  category: 'Art',
                ),
                SizedBox(width: 9.01),
                _buildCoverCard(
                  imagePath: 'assets/images/cover3.jpg',
                  category: 'Digital',
                ),
                SizedBox(width: 9.01),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Trending collections',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/Portrait.png',
                  category: 'Portrait Art',
                  likes: 200,
                ),
                SizedBox(width: 16),
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/Abstract.png',
                  category: 'Abstract Art',
                  likes: 200,
                ),
                SizedBox(width: 16),
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/aa.jpg',
                  category: 'Digital Art',
                  likes: 150,
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top seller',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/seller1.png',
                  category: 'Top Seller 1',
                  likes: 350,
                ),
                SizedBox(width: 16),
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/seller2.png',
                  category: 'Top Seller 2',
                  likes: 300,
                ),
                SizedBox(width: 16),
                _buildTrendingCollectionCard(
                  imagePath: 'assets/images/seller3.png',
                  category: 'Top Seller 3',
                  likes: 280,
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  static Widget _buildCoverCard(
      {required String imagePath, required String category}) {
    return Container(
      width: 252.26,
      height: 167.57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.03),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.9,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(27.03),
                  bottomRight: Radius.circular(27.03),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTrendingCollectionCard({
    required String imagePath,
    required String category,
    required int likes,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xFF2B1D45),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.9,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              width: 160,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text(
                      likes.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
