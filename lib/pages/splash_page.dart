import 'package:flutter/material.dart';
import 'package:flutter_sample/styles.dart';

class SplashPage extends StatefulWidget {
  
  @override
  State createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Text('Ramenian App',
                style: TextStyle(
                  color: AppStyles.primaryFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Text('built with Flutter',
                style: TextStyle(
                  color: AppStyles.primaryFontColor,
                  fontSize: 14
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator()
            )
          ]
        )
      )
    );
  }
}