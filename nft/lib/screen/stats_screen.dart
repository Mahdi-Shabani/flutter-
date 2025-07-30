import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> nftList = [
    {
      'name': 'Azumi',
      'price': 200055.02,
      'change': 3.99,
      'image': 'assets/images/nft_1.jpg'
    },
    {
      'name': 'Hape prime',
      'price': 180055.45,
      'change': 33.79,
      'image': 'assets/images/nft_2.jpg'
    },
    {
      'name': 'Cryoto',
      'price': 90055.62,
      'change': -6.56,
      'image': 'assets/images/nft_3.jpg'
    },
    {
      'name': 'Ape Club',
      'price': 88055.12,
      'change': 3.99,
      'image': 'assets/images/nft_4.jpg'
    },
    {
      'name': 'Bat',
      'price': 10055.06,
      'change': 3.99,
      'image': 'assets/images/nft_5.jpg'
    },
    {
      'name': 'Mutant',
      'price': 9095.27,
      'change': 3.99,
      'image': 'assets/images/nft_6.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double indicatorWidth = 106.3;
    double indicatorHeight = 3.6;
    double tabWidth = MediaQuery.of(context).size.width / 2;
    double indicatorLeft =
        _tabController.index * tabWidth + (tabWidth - indicatorWidth) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFF211134),
      body: Column(
        children: [
          // نوار آیفون بالا
          Image.asset(
            'assets/images/iPhone.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // فقط یک بار Stats و آیکون سه‌نقطه
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Stats",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    'assets/images/Title.png',
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
          ),
          // TabBar و بقیه صفحه
          Stack(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white38,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                tabs: [
                  Tab(
                    icon: Icon(Icons.bar_chart, size: 20),
                    text: "Ranking",
                  ),
                  Tab(
                    icon: Icon(Icons.show_chart, size: 20),
                    text: "Activity",
                  ),
                ],
              ),
              Positioned(
                left: indicatorLeft,
                bottom: 0,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Container(
                    key: ValueKey(_tabController.index),
                    width: indicatorWidth,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFB983FF),
                          Color(0xFF9B5CFF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9B5CFF).withOpacity(0.7),
                          blurRadius: 18,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.white24,
            margin: EdgeInsets.only(top: 0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FilterButton(
                  icon: Icons.grid_view_rounded,
                  label: "All categories",
                ),
                _FilterButton(
                  icon: Icons.link_rounded,
                  label: "All Chains",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3B206B),
                          Color(0xFF4B2B8B),
                          Color(0xFF211134),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: nftList.length,
                      separatorBuilder: (_, __) => Divider(
                        color: Colors.white10,
                        indent: 16,
                        endIndent: 16,
                      ),
                      itemBuilder: (context, index) {
                        final nft = nftList[index];
                        final isPositive = nft['change'] >= 0;
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              CircleAvatar(
                                backgroundImage: AssetImage(nft['image']),
                                radius: 22,
                              ),
                            ],
                          ),
                          title: Text(
                            nft['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'view info',
                            style: TextStyle(
                                color: Colors.purple[200], fontSize: 12),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/eth.png',
                                    width: 18,
                                    height: 18,
                                    color: Colors.grey[400],
                                    colorBlendMode: BlendMode.srcIn,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    nft['price'].toStringAsFixed(2),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${nft['change'] > 0 ? '+' : ''}${nft['change'].toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color: isPositive ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Activity Tab",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2E1A4D),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home, color: Colors.white38),
            Icon(Icons.bar_chart, color: Color(0xFF9B5CFF)),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF9B5CFF),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.add, color: Colors.white),
            ),
            Icon(Icons.search, color: Colors.white38),
            Icon(Icons.person, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FilterButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.white54, size: 18),
        ],
      ),
    );
  }
}
