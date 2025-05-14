import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  static const _green = Color(0xFF5F26B4);
  static const _grey = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: SafeArea(
        top: false,
        child: SizedBox(
            height: 90,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                _buildNavItem(icon: Icons.home, label: "Home", index: 0),
                _buildNavItem(icon: Icons.person_outline, label: "Acoount", index: 1),
                _buildCenterButton(index: 2),
                _buildNavItem(icon: Icons.settings_outlined, label: "Settings", index: 3),
                _buildNavItem(icon: Icons.location_on, label: "Near Me", index: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? _green : _grey;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Container(
                height: 4,
                width: 24,
                decoration: BoxDecoration(
                  color: _green,
                  borderRadius: BorderRadius.circular(2),
                ),
              )
            else
              const SizedBox(height: 4),
            const SizedBox(height: 4),
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton({required int index}) {
    final isSelected = selectedIndex == index;
    final iconColor = Colors.white;
    final labelColor = isSelected ? _green : _grey;

    return GestureDetector(
        onTap: () => onTabSelected(index),
        child: Transform.translate(
        offset: const Offset(0, -25),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                color: _green,
                shape: BoxShape.circle,
                boxShadow: [
                    BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    )
                ],
                ),
                child: Icon(Icons.event_available, color: iconColor, size: 28),
            ),
            const SizedBox(height: 4),
            Text(
                "Booking",
                style: TextStyle(color: labelColor, fontSize: 12),
            ),
            ],
        ),
        ),
    );
    }
}
