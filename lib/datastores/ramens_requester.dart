import 'package:flutter_sample/entities/ramen.dart';

abstract class RamensRequester {
  Future<List<Ramen>> requestRamens();
}