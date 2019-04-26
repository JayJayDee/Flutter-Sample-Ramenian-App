import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_sample/entities/ramen.dart';
import 'package:flutter_sample/factory.dart';

class AppState extends Model {
  List<Ramen> _ramens;
  bool _loading;

  List<Ramen> get ramens => _ramens;
  bool get loading => _loading;

  AppState() {
    _ramens = [];
    _loading = false;
  }

  Future<void> loadRamens() async {
    _loading = true;
    notifyListeners();
    await _waitSec(2);

    _ramens = await factoryInst().ramensRequester.requestRamens();
    print(_ramens);

    _loading = false;
    notifyListeners();
  }
}

Future<void> _waitSec(int sec) =>
  Future.delayed(Duration(seconds: sec));