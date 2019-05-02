import 'package:flutter_sample/datastores/ramens_requester.dart';
import 'package:flutter_sample/datastores/http_ramens_requester.dart';
import 'package:flutter_sample/datastores/favorite_accessor.dart';
import 'package:flutter_sample/datastores/sqlite_favorite_accessor.dart';

class _AppFactory {
  RamensRequester _ramensRequester;
  FavoriteAccessor _favoriteAccessor;

  RamensRequester get ramensRequester => _ramensRequester;
  FavoriteAccessor get favoriteAccessor => _favoriteAccessor;

  _AppFactory() {
    _initInstances();
  }

  void _initInstances() {
    _ramensRequester = HttpRamensRequester(
      baseUrl: 'http://ramenian.chatpot.chat'
    );

    _favoriteAccessor = SqliteFavoriteAccessor(
      version: 1
    );
  }
}


_AppFactory _factoryInst;
void initFactory() {
  _factoryInst = _AppFactory();
}
_AppFactory factoryInst() => _factoryInst;