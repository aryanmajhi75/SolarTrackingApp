import 'package:flutter/material.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';
import 'package:solar/views/LiveData.dart';
import 'package:solar/views/Profile.dart';
import 'package:solar/views/Statistics.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  List<Widget> pages = [
    LiveData(),
    Statistics(),
    Profile(),
  ];

  List<FloatingBottomNavItem> bottomNavItems = const [
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.data_array_rounded),
      activeIcon: Icon(Icons.data_array_rounded),
      label: "LiveData",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.bar_chart_rounded),
      activeIcon: Icon(Icons.bar_chart_rounded),
      label: "Statistics",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.person_2_rounded),
      activeIcon: Icon(Icons.person_2_rounded),
      label: "Profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[0],
        bottomNavigationBar: FloatingBottomNavBar(
          pages: pages,
          items: bottomNavItems,
          initialPageIndex: 0,
          backgroundColor: Colors.green[900],
          elevation: 0,
          radius: 20,
          width: 300,
          height: 65,
        ),
      ),
    );
  }
}