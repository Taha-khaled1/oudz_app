import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application_layer/constant/myapp.dart';
import 'data_layer/database/connectSqlflite.dart';

SqlDb? sqlDb;
late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  sqlDb = SqlDb();
  runApp(
    const MyApp(),
  );
}
