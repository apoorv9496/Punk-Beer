import 'dart:convert';

import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/services/beer_service.dart';
import 'package:punkbeer/services/fav_service.dart';

class FavManager {

  FavManager() {

  }

  Future<List<BeerModel>> getFavorites() async {
    String res = await FavService().getFavorites();

    List<BeerModel> beers = [];
    List<dynamic> beerList = json.decode(res);
    beerList?.forEach((beer) {
      beers.add(BeerModel.fromJson(beer));
    });

    return beers;
  }

  bool isFav({int beerId}) {
    return false;
  }

  Future<Null> toggleFav({int beerId}) async {

  }
}