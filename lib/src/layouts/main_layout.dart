import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/topbar.dart';

class MainLayout extends StatefulWidget {
  final List<Widget> pages;

  const MainLayout({super.key, required this.pages});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopBar(
            // profileImageUrl: null,
            onNotificationTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notification tapped")),
              );
            },
          ),
          Expanded(child: widget.pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
