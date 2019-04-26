import 'package:flutter/material.dart';

Future<bool> showNewRamenDialog(BuildContext context) async =>
  showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add new ramen'),
        content: Text('Are you sure to add new random ramen?'),
        actions: [
          FlatButton(
            child: Text('Okay'),
            onPressed: () => Navigator.of(context).pop(true)
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false)
          )
        ]
      );
    }
  );

Future<bool> showClearRamensDialog(BuildContext context) async =>
  showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Clear all ramen'),
        content: Text('Are you sure to clear all ramens?'),
        actions: [
          FlatButton(
            child: Text('Okay'),
            onPressed: () => Navigator.of(context).pop(true)
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false)
          )
        ]
      );
    }
  );