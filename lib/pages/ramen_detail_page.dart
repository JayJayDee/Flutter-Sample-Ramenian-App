import 'package:flutter/material.dart';
import 'package:flutter_sample/entities/ramen.dart';
import 'package:flutter_sample/factory.dart';
import 'package:flutter_sample/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RamenDetailPage extends StatefulWidget {

  final int ramenId;

  RamenDetailPage({
    @required this.ramenId
  });

  @override
  State createState() => _RamenDetailPageState(ramenId: ramenId);
}

class _RamenDetailPageState extends State<RamenDetailPage> {

  int _ramenId;
  Ramen _ramen;
  bool _loading;

  _RamenDetailPageState({
    @required ramenId
  }) {
    _ramenId = ramenId;
    _ramen = null;
    _loading = false;
  }

  Future<void> _onDeleteClicked(BuildContext context) async {
    
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => loadRamen());
  }

  Future<void> loadRamen() async {
    setState(() {
      _loading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    Ramen fetchedRamen = await factoryInst().ramensRequester.requestRamen(_ramenId);

    setState(() {
      _loading = false;
      _ramen = fetchedRamen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.secondaryFontColor,
        title: Text(_title(_ramen))
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              children: _listWidgets(_ramen,
                callback: () => _onDeleteClicked(context)
              )
            ),
            Positioned(
              child: _progressBar(_loading)
            )
          ]
        )
      )
    );
  }
}

String _title(Ramen ramen) =>
  ramen == null ? 'Loading..' : ramen.name;

Widget _progressBar(bool loading) =>
  loading ? Container(
    width: 80,
    height: 80,
    child: CircularProgressIndicator(
      strokeWidth: 8
    )
  ) : Center();

List<Widget> _listWidgets(Ramen ramen, {
  @required VoidCallback callback
}) {
  if (ramen == null) return [];
  return [
    _ramenImage(ramen.image),
    _deleteButton(callback)
  ];
}

Widget _ramenImage(String imageUrl) =>
  Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl
        )
      ]
    )
  );

Widget _deleteButton(VoidCallback callback) =>
  Container(
    margin: EdgeInsets.all(10),
    child: RaisedButton(
      color: Colors.redAccent,
      child: Text('라면 삭제',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white
        )
      ),
      onPressed: callback,
    )
  );