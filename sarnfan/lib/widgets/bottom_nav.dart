import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        label: 'FAQ',
        path: "/faq",
        isGo: true
      ),
      NavItem(
        icon: const Icon(Icons.home),
        label: 'Home',
        path: "/home",
        isGo: true,
      ),
      NavItem(
        icon: const Icon(Icons.star),
        label: 'Starred',
        path: "/starred",
        isGo: true,
      ),
      NavItem(
        icon: const Icon(Icons.face),
        label: 'Profile',
        path: "/my-profile",
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

    return SizedBox(
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
