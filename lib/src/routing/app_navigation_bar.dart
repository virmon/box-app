import 'package:flutter/material.dart';
import 'package:box_app/src/routing/scaffold_with_navigation_bar.dart';
import 'package:box_app/src/routing/scaffold_with_navigation_rail.dart';
import 'package:go_router/go_router.dart';

class NavigationLabel {
  static const list = 'Products';
  static const search = 'Search';
  static const add = 'Add product';
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('AppNavigationBar'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return ScaffoldWithNavigationBar(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        } else {
          return ScaffoldWithNavigationRail(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        }
      },
    );
  }
}
