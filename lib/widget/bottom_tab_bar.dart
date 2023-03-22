import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:study_app/controller/bottom_tab_bar_controller.dart';


class BottomTabBar extends GetView<BottomTabBarController> {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: context.theme.colorScheme.onBackground,
          unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedLabelStyle: TextStyle(fontSize: 10),
          type: BottomNavigationBarType.fixed,
          backgroundColor: context.theme.colorScheme.background,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "tap1"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "tap2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "tap3"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "tap4"),
          ],
        ));
  }
}

