import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jai_kisan/database/user_database_helper.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userName = "";
  String phoneNumber = "";
  bool dataLoaded = false;

  void getDataFromDatabase() async {
    var data = await UserDataBaseHelper.instance.queryAll();
    userName = data[0].name;
    phoneNumber = data[0].phoneNumber;
    setState(() {
      dataLoaded = true;
    });
  }

  Widget featureTile(String s,IconData ic,Color c){

    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: c,
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text(s,style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.5),fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),),
              )),

          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Icon(ic,color: Colors.black.withOpacity(0.5),size: 22,),
              )),
        ],
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: const Color(0xFF1AAD9E),
        title: const Text("User Profile"),
        centerTitle: true,
      ),*/

      body: dataLoaded
          ? Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: const Color(0xFF1AAD9E),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 32, 0, 0),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black.withOpacity(0.6),
                          size: 18,
                        ),
                      ),
                    )),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 20,
                        ),
                      ),
                    )),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  //borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/login_bg.jpg',
                                    ),
                                    radius: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.25,
                        ),
                        child: Text(
                          userName.toUpperCase(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ))),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.32,
                      ),
                      child: Text(
                        phoneNumber,
                        style: GoogleFonts.roboto(
                            fontSize: 30, color: Colors.white),
                      )),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.45,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                featureTile("My Orders", Icons.delivery_dining,const Color(0xFFB8F8F4),),

                                const SizedBox(
                                  height: 30,
                                ),

                                featureTile("Settings",Icons.settings, const Color(
                                    0xFFA0FFA1),),

                                const SizedBox(
                                  height: 30,
                                ),

                                featureTile("Log Out",Icons.logout, const Color(
                                    0xFFF4FAA0),)
                              ],
                            ),
                          ),
                        ))),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
