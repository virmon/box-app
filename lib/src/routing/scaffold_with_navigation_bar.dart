import 'package:flutter/material.dart';
import 'package:box_app/src/routing/app_navigation_bar.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            label: NavigationLabel.list,
            icon: Icon(Icons.list, color: Colors.white70),
          ),
          NavigationDestination(
            label: NavigationLabel.search,
            icon: Icon(Icons.search, color: Colors.white70),
          ),
          NavigationDestination(
            label: NavigationLabel.add,
            icon: Icon(Icons.add, color: Colors.white70),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
