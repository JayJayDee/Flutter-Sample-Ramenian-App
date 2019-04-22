import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ramenian App'),
      ),
      body: SafeArea(
        child: ListView(
          children: []
        )
      )
    );
  }
}