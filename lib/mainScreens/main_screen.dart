import 'package:flutter/material.dart';
import '../tabPages/tab_export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void onItemClicked(int index) {
    setState(() {
      tabController!.index = selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Main Screen'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rating'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 14),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabController!.index,
        onTap: onItemClicked,
      ),
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeTabScreen(),
          EarningTabScreen(),
          RatingsTabScreen(),
          ProfileTabScreen(),
        ],
      ),
    );
  }
}
