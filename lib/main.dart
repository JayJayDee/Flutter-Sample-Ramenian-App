import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/splash_page.dart';
import 'package:flutter_sample/states/app_state.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashPage()
      },
    )
  );
}