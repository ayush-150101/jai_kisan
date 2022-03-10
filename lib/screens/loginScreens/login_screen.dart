import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jai_kisan/database/user_database_helper.dart';
import 'package:jai_kisan/models/language.dart';
import 'package:jai_kisan/models/user.dart';
import 'package:jai_kisan/screens/shoppingScreens/farming_selection_screen.dart';
import 'package:jai_kisan/utilities/utils.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  String languageCode;
  LoginScreen({Key? key, required this.languageCode}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  OtpFieldController otpController = OtpFieldController();
  int otp = 0;
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  bool otpGenerated = false;
  late final Animation<double> _animation;
  late final AnimationController _controller;
  final GlobalKey<FormState> _phoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();

  void generateOtp() {
    var rng = Random();
    var rand = rng.nextInt(90000) + 10000;
    otp = rand.toInt();
    print("OTP: $otp");
    createNotification(otp.toString());
    setState(() {
      otpGenerated = true;
      _controller.forward();
    });
  }

  Future<void> createNotification(String s) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'OTP',
          body: s,
          notificationLayout: NotificationLayout.Messaging,
          summary: "s"),
    );
    print('Notification');
  }

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(
      'resource://mipmap/ic_launcher',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          defaultColor: Colors.teal,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: 'OTP',
        ),
      ],
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/login_bckgr.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/splash-screen.gif')),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        //color: Colors.white,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _nameKey,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter name';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.done,
                                    controller: nameTextController,
                                    obscureText: false,
                                    decoration:InputDecoration(
                                      hintText: Language.translator('Enter your name',widget.languageCode),
                                      //hintStyle: TextStyle(),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        //color: Colors.white,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _phoneNumberKey,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter phone number';
                                      } else if (value.length != 10) {
                                        return 'Please enter valid phone number';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    controller: phoneTextController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: Language.translator('Enter your phone number',widget.languageCode),
                                      //hintStyle: TextStyle(),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (_phoneNumberKey.currentState!.validate() &&
                        _nameKey.currentState!.validate()) {
                      generateOtp();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      Language.translator('Generate OTP',widget.languageCode),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                  ),
                )
              ],
            ),
          ),
          otpGenerated
              ? FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(Language.translator('Enter Your OTP',widget.languageCode)),
                            OTPTextField(
                              controller: otpController,
                              length: 5,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 30,
                              style: const TextStyle(fontSize: 17),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onCompleted: (pin) async{
                                if (pin == otp.toString()) {
                                  await UserDataBaseHelper.instance.insert(UserModel(
                                    name: nameTextController.text,
                                    phoneNumber: phoneTextController.text,
                                    preferredLanguage: widget.languageCode,
                                  ));
                                  Get.to(FarmingSelectionScreen(languageCode: widget.languageCode,phoneNumber: phoneTextController.text,),
                                      transition: Transition.fade,
                                      duration: const Duration(seconds: 1));
                                } else {
                                  otpController.clear();
                                  Utils.showToast("Incorrect OTP !");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
