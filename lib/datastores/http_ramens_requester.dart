import 'package:meta/meta.dart';
import 'package:flutter_sample/datastores/ramens_requester.dart';
import 'package:flutter_sample/entities/ramen.dart';

class HttpRamensRequester extends RamensRequester {

  String _baseUrl;

  HttpRamensRequester({
    @required String baseUrl
  }) {
    _baseUrl = baseUrl;
  }

  Future<List<Ramen>> requestRamens() async {
    return List();
  }
}