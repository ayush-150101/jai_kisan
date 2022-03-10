import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserModel{

  String name;
  String phoneNumber;
  String preferredLanguage;

  UserModel({required this.name, required this.phoneNumber, required this.preferredLanguage});

  Map<String, dynamic> toMap(){
    return {"name":name, "phoneNumber": phoneNumber, "preferredLanguage": preferredLanguage};
  }

}