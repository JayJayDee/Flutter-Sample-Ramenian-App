import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_sample/states/app_state.dart';
import 'package:flutter_sample/styles.dart';
import 'package:flutter_sample/entities/ramen.dart';
import 'package:flutter_sample/components/dialogs.dart';
import 'package:flutter_sample/components/ramen_row.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<void> _onRamenSelected(BuildContext context, Ramen ramen) async {

  }

  Future<void> _onAddClicked(BuildContext context) async {
    bool isOk = await showNewRamenDialog(context);
    AppState state = ScopedModel.of<AppState>(context);
    if (isOk == true) {
      await state.addNewRamen();
    }
  }

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
      appBar: _appBar(context,
        addCallback: _onAddClicked
      ),
      backgroundColor: AppStyles.backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _mainListView(context,
              onRamenSelect: (ramen) => _onRamenSelected(context, ramen)
            ),
            Positioned(
              child: _progressBar(context)
            )
          ]
        )
      )
    );
  }
}

typedef EventCallback (BuildContext context);

Widget _appBar(BuildContext context, {
  @required EventCallback addCallback
}) {
  AppState state = ScopedModel.of<AppState>(context, rebuildOnChange: true);
  return AppBar(
    title: Text('Ramenian App'),
    backgroundColor: AppStyles.secondaryFontColor,
    actions: [
      IconButton(
        icon: Icon(Icons.add),
        onPressed: state.loading == true ?
          null : () => addCallback(context)
      )
    ]
  );
}

Widget _progressBar(BuildContext context) {
  AppState state = ScopedModel.of<AppState>(context, rebuildOnChange: true);
  if (state.loading == true) {
    return Container(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        strokeWidth: 8,
      )
    );
  }
  return Center();
}

typedef RamenSelectListener (Ramen ramen);

Widget _mainListView(BuildContext context, {
  @required RamenSelectListener onRamenSelect
}) {
  AppState state = ScopedModel.of<AppState>(context, rebuildOnChange: true);
  if (state.ramens.length == 0) return _emptyView(context);

  return ListView.builder(
    itemCount: state.ramens.length,
    itemBuilder: (BuildContext context, int idx) =>
      RamenRow(
        ramen: state.ramens[idx],
        onSelect: (ramen) => onRamenSelect(ramen)
      )
  );
}

Widget _emptyView(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Column(
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
        Text('There are no ramens',
          style: TextStyle(
            fontSize: 18,
            color: AppStyles.secondaryFontColor
          ),
        )
      ]
    )
  );
}