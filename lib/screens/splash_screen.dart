import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jai_kisan/database/user_database_helper.dart';
import 'package:jai_kisan/screens/shoppingScreens/farming_selection_screen.dart';
import 'package:jai_kisan/screens/loginScreens/language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  void checkDatabase() async{

    var x = await UserDataBaseHelper.instance.queryAll();
    if(x.isEmpty){
      Timer(const Duration(seconds: 1, milliseconds: 800), () {
        Get.to(const LanguageScreen(),
            transition: Transition.fade, duration: const Duration(seconds: 1));
      });
    }
    else{
      Timer(const Duration(seconds: 1, milliseconds: 800), () {
        Get.off(FarmingSelectionScreen(languageCode: x[0].preferredLanguage,phoneNumber: x[0].phoneNumber,),
            transition: Transition.fade, duration: const Duration(seconds: 1));
      });
    }

  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    checkDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/splash-screen.gif',
            fit: BoxFit.fill,
          )),
          const SizedBox(
            height: 20,
          ),
          FadeTransition(
              opacity: _animation,
              child: const Text(
                'Jai Kishan',
                style: TextStyle(fontSize: 35, letterSpacing: 2),
              ))
        ],
      ),
    );
  }
}
