import 'package:flutter/material.dart';
import 'package:box_app/src/routing/app_navigation_bar.dart';

class ScaffoldWithNavigationRail extends StatefulWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<ScaffoldWithNavigationRail> createState() =>
      _ScaffoldWithNavigationRailState();
}

class _ScaffoldWithNavigationRailState
    extends State<ScaffoldWithNavigationRail> {
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final isMobile = screenSize < 600;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            selectedIndex: widget.selectedIndex,
            onDestinationSelected: widget.onDestinationSelected,
            labelType: NavigationRailLabelType.none,
            extended: isExtended,
            leading: IconButton(
              onPressed: () {
                setState(() {
                  isExtended = !isExtended;
                });
              },
              icon: Icon(
                isExtended
                    ? Icons.arrow_circle_left_rounded
                    : Icons.arrow_circle_right_rounded,
                color: Colors.white70,
              ),
            ),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text(NavigationLabel.list),
                icon: Icon(Icons.list, color: Colors.white70),
              ),
              NavigationRailDestination(
                label: Text(NavigationLabel.search),
                icon: Icon(Icons.search, color: Colors.white70),
              ),
              NavigationRailDestination(
                label: Text(NavigationLabel.add),
                icon: Icon(Icons.add, color: Colors.white70),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.body),
        ],
      ),
    );
  }
}
