import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_sample/states/app_state.dart';
import 'package:flutter_sample/styles.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      AppState state = ScopedModel.of<AppState>(context);
      state.loadRamens();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ramenian App'),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _mainListView(context),
            Positioned(
              child: _progressBar(context)
            )
          ]
        )
      )
    );
  }
}

Widget _progressBar(BuildContext context) {
  AppState state = ScopedModel.of<AppState>(context, rebuildOnChange: true);
  if (state.loading == true) {
    return CircularProgressIndicator();
  }
  return Center();
}

Widget _mainListView(BuildContext context) {
  AppState state = ScopedModel.of<AppState>(context, rebuildOnChange: true);

  if (state.ramens == null) return Center();
  if (state.ramens.length == 0) return _emptyView(context);

  return ListView(
    children: []
  );
}

Widget _emptyView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Icon(
          Icons.delete_forever,
          size: 80,
          color: AppStyles.secondaryFontColor,
        )
      ),
      Text('There are no ramens..',
        style: TextStyle(
          fontSize: 18,
          color: AppStyles.secondaryFontColor
        ),
      )
    ]
  );
}