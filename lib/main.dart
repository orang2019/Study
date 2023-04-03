import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/page_list.dart';

void main(){
  runApp(
    GetMaterialApp(
      initialRoute: Routes.routePage,
      getPages: PageList.pages,

      theme : ThemeData(
        fontFamily: "Pretendard",
        primaryColor: Colors.white,

        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor:Colors.black,
            )
        ),

        // bold사용법
        // Text("안녕하세요", style: TextStyle(fontFamily: "SpoqaHanSansNeo", fontWeight: FontWeight.bold))
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Pretendard',fontSize:24),
          titleMedium: TextStyle(fontFamily: 'Pretendard',fontSize:20),
          bodyMedium: TextStyle(fontFamily: 'Pretendard',fontSize: 16),
          labelMedium: TextStyle(fontFamily: 'Pretendard',fontSize: 10),
      ),
    )
  ));
}