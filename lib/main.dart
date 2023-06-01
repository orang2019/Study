import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/model/note.dart';
import 'model/qa.dart';
import 'routes/page_list.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/repository/box_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(QAAdapter());
  await BoxRepository.openBox();

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

        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Pretendard',fontSize:24),
          titleMedium: TextStyle(fontFamily: 'Pretendard',fontSize:20),
          bodyMedium: TextStyle(fontFamily: 'Pretendard',fontSize: 16),
          labelMedium: TextStyle(fontFamily: 'Pretendard',fontSize: 10),
      ),
    )
  ));
}