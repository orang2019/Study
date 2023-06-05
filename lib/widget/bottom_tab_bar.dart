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

          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),

          type: BottomNavigationBarType.fixed,

          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(
                label: "노트",
                icon: SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/노트.png')),
                activeIcon: SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/노트누름.png'))),

            BottomNavigationBarItem(
                label: "암기하기",
                icon: SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/암기.png')),
                activeIcon: SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/암기누름.png'))),
            BottomNavigationBarItem(
                label: "복습일정",
                icon : SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/달력.png')),
                activeIcon: SizedBox(width: 42,height: 51,child: Image.asset('assets/icons/달력누름.png')),
                ),
            BottomNavigationBarItem(
                label: "설정",
                icon : SizedBox(width: 29.91,height: 51,child: Image.asset('assets/icons/설정.png')),
                activeIcon: SizedBox(width: 29.91,height: 51,child: Image.asset('assets/icons/설정누름.png'))
                ),

          ],
        ));
  }
}

