import 'package:hive/hive.dart';

class FavService {

  FavService() {
    Hive.openBox("fav");
  }

  getFavorites() {

  }
}