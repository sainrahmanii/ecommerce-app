import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/constants/colors.dart';

import '../../common/constants/images.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Explore Screen")),
    const Center(child: Text("Cart Screen")),
    const Center(child: Text("Account Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorName.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconSearch)),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconCart)),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconUser)),
            label: "User",
          ),
        ],
      ),
    );
  }
}
