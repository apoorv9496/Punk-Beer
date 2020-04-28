import 'dart:convert';

import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/service_provider.dart';

class BeerManager {

  Stream fetchPage(int pageNum) async* {
    String res = await ServiceProvider().fetchPage(pageNum);
    yield BeerModel.fromJson(json.decode(res));
  }

  bool isFav({int beerId}) {
    return false;
  }

  Future<Null> toggleFav({int beerId}) async {

  }
}