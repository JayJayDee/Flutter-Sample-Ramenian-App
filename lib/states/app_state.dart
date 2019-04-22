import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_sample/entities/ramen.dart';

class AppState extends Model {
  List<Ramen> _ramens;

  List<Ramen> get ramens => _ramens;

  AppState() {
    _ramens = List();
  }
}