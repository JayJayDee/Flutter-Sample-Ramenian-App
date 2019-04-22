import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_sample/factory.dart';
import 'package:flutter_sample/states/app_state.dart';
import 'package:flutter_sample/pages/splash_page.dart';
import 'package:flutter_sample/pages/main_page.dart';

void main() {
  initFactory();
  runApp(
    ScopedModel<AppState>(
      model: AppState(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashPage(),
          '/main': (BuildContext context) => MainPage()
        }
      )
    )
  );
}