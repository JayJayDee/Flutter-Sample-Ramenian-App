import 'package:flutter_sample/entities/ramen.dart';

abstract class RamensRequester {
  Future<List<Ramen>> requestRamens();
  Future<Ramen> requestRamen(int ramenId);
  Future<void> deleteRamen(int ramenId);
  Future<void> requestNewRamen();
  Future<void> requestClear();
}