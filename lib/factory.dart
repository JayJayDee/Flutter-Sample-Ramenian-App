import 'package:flutter_sample/datastores/ramens_requester.dart';
import 'package:flutter_sample/datastores/http_ramens_requester.dart';

class _AppFactory {
  RamensRequester _ramensRequester;

  RamensRequester get ramensRequester => _ramensRequester;

  _AppFactory() {
    _ramensRequester = HttpRamensRequester(
      baseUrl: 'http://dev-auth.chatpot.chat'
    );
  }
}


_AppFactory _factoryInst;
void initFactory() {
  _factoryInst = _AppFactory();
}
_AppFactory factoryInst() => _factoryInst;