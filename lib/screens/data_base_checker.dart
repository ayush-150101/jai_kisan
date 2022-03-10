import 'package:flutter/material.dart';
import 'package:jai_kisan/database/user_database_helper.dart';
import 'package:jai_kisan/models/user.dart';

class DataBaseChecker extends StatefulWidget {
  const DataBaseChecker({Key? key}) : super(key: key);

  @override
  _DataBaseCheckerState createState() => _DataBaseCheckerState();
}

class _DataBaseCheckerState extends State<DataBaseChecker> {
  Future<List<UserModel>> getAllData() async {
    var list = await UserDataBaseHelper.instance.queryAll();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              UserDataBaseHelper.instance.insert(UserModel(
                name: "Ayush",
                phoneNumber: "7550869629",
                preferredLanguage: "en-US",
              ));
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.red,
              child: Text('Add Data'),
            ),
          ),
          InkWell(
            onTap: () async {
              List<UserModel> x = await getAllData();
              if (x.length == 0)
                print("database empty");
              else
                for (int i = 0; i < x.length; i++) {
                  print(
                      "${x[i].name} ${x[i].phoneNumber} ${x[i].preferredLanguage}");
                }
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.red,
              child: Text('Get Data'),
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              width: 200,
              color: Colors.red,
              child: Text('Update Data'),
            ),
          ),
          InkWell(
            onTap: () => UserDataBaseHelper.instance.clear(),
            child: Container(
              height: 50,
              width: 200,
              color: Colors.red,
              child: Text('Delete Data'),
            ),
          ),
        ],
      ),
    );
  }
}
