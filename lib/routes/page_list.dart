import 'package:get/get.dart';
import 'package:study_app/page/notepage/note_home.dart';
import 'package:study_app/page/quizpage/quiz_home.dart';
import 'package:study_app/page/calendarpage/calendar_home.dart';
import 'package:study_app/page/settingpage/setting_home.dart';
import 'package:study_app/routes/route_page.dart';


class PageList {
  static final pages =[
    GetPage(name: Routes.calendarHome, page: () => CalendarHome()),
    GetPage(name: Routes.noteHome, page: ()=> NoteHome()),
    GetPage(name: Routes.quizHome, page: () => QuizHome()),
    GetPage(name: Routes.settingsHome, page: ()=> SettingsHome()),
    GetPage(name: Routes.routePage, page: ()=>RoutePage()),
  ];
}

abstract class Routes{
  static const routePage ='/';
   static const calendarHome ='/calendar_home_page';
   static const noteHome = '/note_home_page';
   static const settingsHome = '/settings_home_page';
   static const quizHome = '/quiz_home_page';
}