import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/bottom_tab_bar_controller.dart';
import 'package:study_app/routes/bottom_tab_bar.dart';

class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  
  Widget build(BuildContext context) {

    Get.put(BottomTabBarController());

    return Scaffold(
      body: Text("Note"),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}