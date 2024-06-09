import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';

class NavItem {
  Widget icon;
  String label;
  String path;
  bool isGo = false;
  NavItem({
    required this.icon,
    required this.label,
    required this.path,
    this.isGo = false,
  });
}

class BottomNav extends StatelessWidget {
  final String? path;
  const BottomNav({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final paths = [
      NavItem(
        icon: const Icon(Icons.info),
        label: 'Help',
        path: "/help",
      ),
      NavItem(
        icon: const Icon(Icons.home),
        label: 'Home',
        path: "/",
        isGo: true,
      ),
      NavItem(
        icon: const Icon(Icons.star),
        label: 'Star',
        path: "/star",
        isGo: true,
      ),
      NavItem(
        icon: const Icon(Icons.face),
        label: 'Profile',
        path: "/profile",
        isGo: true,
      ),
    ];

    int whichIndex() {
      for (int i = 0; i < paths.length; i++) {
        if (path == paths[i].path) {
          return i;
        }
      }
      return 0;
    }

    void onChangeRoute(int index) {
      if (paths[index].isGo) {
        context.go(paths[index].path);
      } else {
        context.push(paths[index].path, extra: true);
      }
    }

    return Container(
      width: double.infinity,
      child: BottomNavigationBar(
        // backgroundColor: AppColors.,
        items: paths.map((NavItem item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
          );
        }).toList(),
        currentIndex: whichIndex(),
        // unselectedItemColor: AppColors.grey,
        // selectedItemColor: AppColors.grey,
        showUnselectedLabels: true,
        onTap: onChangeRoute,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
