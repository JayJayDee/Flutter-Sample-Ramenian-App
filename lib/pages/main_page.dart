import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

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