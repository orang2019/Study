import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/bottom_tab_bar_controller.dart';
import 'package:study_app/page/calendarpage/calendar_home.dart';
import 'package:study_app/page/notepage/note_home.dart';
import 'package:study_app/page/quizpage/quiz_home.dart';
import 'package:study_app/page/settingpage/setting_home.dart';
import 'package:study_app/widget/bottom_tab_bar.dart';

class RoutePage extends StatelessWidget{

  static List<Widget> tabPages = <Widget>[
    NoteHome(),
    QuizHome(),
    CalendarHome(),
    SettingsHome(),
  ];

  @override
  Widget build(BuildContext context) {


    Get.put(BottomTabBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(title: Text("Study App Demo")),
      body: Obx(() => SafeArea(
          child:
              // static 변수를 이용해 컨트롤러 접근
              tabPages[BottomTabBarController.to.selectedIndex.value])),
       // 2번에서 만든 BottomNavgationBar 컴포넌트
      bottomNavigationBar: BottomTabBar(),
    );
  }
}