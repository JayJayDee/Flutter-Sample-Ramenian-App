import 'package:flutter/material.dart';

class RamenDetailPage extends StatefulWidget {

  String _ramenId;

  RamenDetailPage({
    @required String ramenId
  }) {
    this._ramenId = ramenId;
  }

  @override
  State createState() => _RamenDetailPageState(ramenId: _ramenId);
}

class _RamenDetailPageState extends State<RamenDetailPage> {

  String _ramenId;

  _RamenDetailPageState({
    @required ramenId
  }) {
    _ramenId = ramenId;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}