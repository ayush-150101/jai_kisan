import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  ///Function to show toast message
  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
    );
  }

}