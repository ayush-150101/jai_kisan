import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jai_kisan/screens/loginScreens/login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  Widget languageTile(BuildContext context,String s,Color c,String languageCode){

    return InkWell(
      onTap: () => Get.to(LoginScreen(languageCode: languageCode,),transition: Transition.fade,duration: const Duration(seconds: 1)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12,15,12,15),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-16.0, -16.0),
                    blurRadius: 26.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(16.0, 16.0),
                    blurRadius: 26.0,
                  ),
                ],
              color: c,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Center(child: Text(s,style: TextStyle(fontSize: 30,color: Colors.white),),),
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            languageTile(context, "हिन्दी", Color(0xFF1AAD9E),"hi"),
            languageTile(context, "বাংলা", Color(0xFF88FC2E),"bn"),
            languageTile(context, "English", Color(0xFFF5C225),"en"),
          ],
        ),
      ),
    );
  }
}
