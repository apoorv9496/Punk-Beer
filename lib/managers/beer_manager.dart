import 'dart:convert';

import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/services/beer_service.dart';

class BeerManager {

  Future<List<BeerModel>> fetchPage(int pageNum) async {
    String res = await BeerService().fetchPage(pageNum);

    List<BeerModel> beers = [];
    List<dynamic> beerList = json.decode(res);
    beerList?.forEach((beer) {
      beers.add(BeerModel.fromJson(beer));
    });

    return beers;
  }
}