import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/beer_tile.dart';
import 'package:punkbeer/managers/fav_manager.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  FavManager favManager = FavManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('fav').listenable(),
        builder: (context, box, widget) {

          return FutureBuilder<List<BeerModel>>(
            future: favManager.openBox(),
            builder: (context, snapshot) {

              List<BeerModel> favs = favManager.getFavorites();

              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Container();
                  break;
                case ConnectionState.done:
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: favs.length,
                    itemBuilder: (context, index) => BeerTile(beer: favs[index],),
                  );
                  break;
                default: return Container();
              }
            }
          );
        }
      ),
    );
  }
}
