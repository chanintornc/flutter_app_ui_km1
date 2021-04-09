import 'package:flutter/material.dart';
import 'package:flutter_app_ui_km1/constants.dart';
import 'package:flutter_app_ui_km1/screens/home_ui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: HomeUI(),
    ),
  );
}
