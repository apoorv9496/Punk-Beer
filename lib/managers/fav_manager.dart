import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:punkbeer/beer_model.dart';

class FavManager {

  /// Default box.
  String box = "fav";

  /// Returns list of favorite beers.
  List<BeerModel> getFavorites() {
    if(this.box == null) return [];

    List<BeerModel> beers = [];

    if(Hive.isBoxOpen(this.box)) {
      Hive.box(this.box).toMap().forEach((beerId, beerData) {
        beers.add(BeerModel.fromJson(json.decode(beerData)));
      });
    }
    
    return beers;
  }

  /// Returns fav status of the passed beer.
  bool isFav({BeerModel beer}) {
    if(this.box == null) return false;

    if(Hive.isBoxOpen(this.box)) {
      if(Hive.box(this.box).containsKey(beer.id))
        return true;
    }

    return false;
  }

  Future<Null> toggleFav({BeerModel beer}) async {
    if(this.box == null) return;

    if(Hive.isBoxOpen(this.box)) {
      if(Hive.box(this.box).containsKey(beer.id)) {
        Hive.box(this.box).delete(beer.id);
      } else {
        Hive.box(this.box).put(beer.id, beer.toJson());
      }
    }
  }

  /// Names and opens the box.
  Future<Null> openBox() async {

    // Todo: Name boxes as a suffix to user's email to store favorites of each user separately.
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    this.box = "fav";
    await Hive.openBox(box);
  }

  /// Closes all hive boxes.
  void closeBox() {
    Hive.close();
  }
}