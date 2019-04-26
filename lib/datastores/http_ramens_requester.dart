import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
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
    String url = "$_baseUrl/ramens";
    Response resp = await Dio().get(url);

    List<dynamic> rawRamens = resp.data;
    List<Ramen> ramens =
      rawRamens.map((r) {
        Map<String, dynamic> map = r;
        return Ramen.fromJson(map);
      }).toList();

    return ramens;
  }

  Future<void> requestNewRamen() async {
    String url = "$_baseUrl/ramen";
    await Dio().post(url);
  }

  Future<void> requestClear() async {
    String url = "$_baseUrl/clear";
    await Dio().post(url);
  }
}