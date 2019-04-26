import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RamenTag extends StatelessWidget {

  final String tag;

  RamenTag({
    @required this.tag
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.blue,
        child: Text(tag,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          )
        )
      )
    );
  }
}