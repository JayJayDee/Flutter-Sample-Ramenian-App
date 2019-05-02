import 'package:meta/meta.dart';
import 'dart:async';
import 'package:flutter_sample/datastores/favorite_accessor.dart';

class SqliteFavoriteAccessor extends FavoriteAccessor {

  int _version;

  SqliteFavoriteAccessor({
    @required int version
  }) {
    _version = version;
  }

  Future<List<int>> fetchFavoriteIds() async {
    return [
      1, 3, 5, 7, 9
    ];
  }

  Future<void> storeFavoriteId(int ramenId) async {

  }
}