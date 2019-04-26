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

  Future<void> clearRamens() async {
    _loading = true;
    notifyListeners();
    await _waitSec(1);

    await factoryInst().ramensRequester.requestClear();
    _ramens = [];

    _loading = false;
    notifyListeners();
  }

  Future<void> loadRamens() async {
    _loading = true;
    notifyListeners();
    await _waitSec(1);

    _ramens = await factoryInst().ramensRequester.requestRamens();

    _loading = false;
    notifyListeners();
  }

  Future<void> addNewRamen() async {
    _loading = true;
    notifyListeners();
    await _waitSec(1);

    await factoryInst().ramensRequester.requestNewRamen();
    _ramens = await factoryInst().ramensRequester.requestRamens();

    _loading = false;
    notifyListeners();
  }
}

Future<void> _waitSec(int sec) =>
  Future.delayed(Duration(seconds: sec));