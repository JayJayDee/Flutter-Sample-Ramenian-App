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

  Future<void> deleteRamen(int ramenId) async {
    _loading = true;
    notifyListeners();
    await _waitSec(1);

    await factoryInst().ramensRequester.deleteRamen(ramenId);
    _ramens = await factoryInst().ramensRequester.requestRamens();

    _loading = false;
    notifyListeners();
  }

  void _applyFavorites(List<int> favorites, List<Ramen> ramens) {
    ramens.forEach((r) {
      if (favorites.where((favId) => favId == r.id).toList().length > 0) {
        r.setFavorite();
      } else {
        r.unsetFavorite();
      }
    });
  }

  Ramen getRamen(int ramenId) {
    List<Ramen> ramens = _ramens.where((r) => r.id == ramenId).toList();
    if (ramens.length > 0) return ramens[0];
    return null;
  }

  Future<void> markFavorite(int ramenId) async {
    await factoryInst().favoriteAccessor.storeFavoriteId(ramenId);
    this.getRamen(ramenId).setFavorite();
  }

  Future<void> unmarkFavorite(int ramenId) async {
    await factoryInst().favoriteAccessor.removeFavoriteId(ramenId);
    this.getRamen(ramenId).unsetFavorite();
  }
}

Future<void> _waitSec(int sec) =>
  Future.delayed(Duration(seconds: sec));