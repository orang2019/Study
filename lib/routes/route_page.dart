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
    const NoteHome(),
    const QuizHome(),
    const CalendarHome(),
    const SettingsHome(),
  ];

  @override
  Widget build(BuildContext context) {


    Get.put(BottomTabBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Obx(() => SafeArea(
              child:tabPages[BottomTabBarController.to.selectedIndex.value]
            )),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}