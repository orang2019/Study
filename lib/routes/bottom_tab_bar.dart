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

class RootScaffold extends StatelessWidget{

  // 탭별 화면
  static List<Widget> tabPages = <Widget>[

  ];

  @override
  Widget build(BuildContext context) {

    // 페이지 전환을 위한 MyBottomNavgationBarController 인스턴스화 (의존성 주입)
    // Get.put : 수명이 페이지와 같음
    Get.put(BottomTabBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,

      body: Obx(() => SafeArea(
          child:
              // static 변수를 이용해 컨트롤러 접근
              tabPages[BottomTabBarController.to.selectedIndex.value])),
       // 2번에서 만든 BottomNavgationBar 컴포넌트
      bottomNavigationBar: BottomTabBar(),
    );
  }
}