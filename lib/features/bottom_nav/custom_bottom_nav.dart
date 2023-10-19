import 'package:flutter/material.dart';
import 'package:flutter_go_router_bottom_nav_example/router/router_context_extension.dart';
import '../../router/routes_names.dart';

class CustomBottomNav extends StatefulWidget {
  final int selectedIndex;
  final Function(int index)? onItemTapped;

  const CustomBottomNav({
    super.key,
    this.selectedIndex = -1,
    this.onItemTapped,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomSheetItem(
            label: 'Home',
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(0)
                : _defaultOnItemTap(0),
            icon: Icon(
              Icons.home_outlined,
              size: 25,
              color: widget.selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            labelColor: widget.selectedIndex == 0 ? Colors.black : Colors.grey,
          ),
          _bottomSheetItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
              size: 25,
              color: widget.selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(1)
                : _defaultOnItemTap(1),
            labelColor: widget.selectedIndex == 1 ? Colors.black : Colors.grey,
          ),
          _bottomSheetItem(
            label: 'Settings',
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(2)
                : _defaultOnItemTap(2),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Icon(
                Icons.settings,
                size: 25,
                color: widget.selectedIndex == 2 ? Colors.black : Colors.grey,
              ),
            ),
            labelColor: widget.selectedIndex == 2 ? Colors.black : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _bottomSheetItem({
    required String label,
    required Color labelColor,
    required Widget icon,
    required Function() onPressed,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () => onPressed(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 3.0),
                icon,
                const SizedBox(height: 2.0),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: labelColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _defaultOnItemTap(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
        context.popUntil(RouteNames.bottomNav);
        break;
    }
  }
}
