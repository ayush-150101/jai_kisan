import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jai_kisan/screens/data_base_checker.dart';
import 'package:jai_kisan/screens/shoppingScreens/farming_selection_screen.dart';
import 'package:jai_kisan/screens/loginScreens/language_screen.dart';
import 'package:jai_kisan/screens/loginScreens/login_screen.dart';
import 'package:jai_kisan/screens/splash_screen.dart';
import 'package:jai_kisan/screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the applicationffs`qqqqqqq````````````````````````````````
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
       //TestScreen(),
    );
  }
}

