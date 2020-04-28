import 'package:flutter/material.dart';
import 'package:punkbeer/managers/beer_manager.dart';
import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/beer_tile.dart';
import 'package:punkbeer/managers/fav_manager.dart';
import 'package:punkbeer/screens/fav_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BeerManager beerManager = BeerManager();
  FavManager favManager = FavManager();

  int currPage = 1;
  List<BeerModel> allBeers = [];

  @override
  void initState() {
    super.initState();

    favManager.openBox();
  }

  @override
  void dispose() {
    favManager.closeBox();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Punk Beer"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: showFavs),
        ],
      ),
      body: FutureBuilder<List<BeerModel>>(
        future: beerManager.fetchPage(currPage),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              List<BeerModel> beers = snapshot.data;
              allBeers.addAll(beers);

              return NotificationListener(
                onNotification: (notif) {
                  if(notif is ScrollEndNotification) {
                    if(notif.metrics.pixels >= notif.metrics.maxScrollExtent) {
                      setState(() {
                        currPage++;
                      });
                    }
                  }

                  return true;
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: allBeers.length,
                  itemBuilder: (context, index) {
                    return BeerTile(beer: allBeers[index],);
                  },
                ),
              );
              break;
            default: return Container();
          }
        }
      ),
    );
  }

  void showFavs() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FavPage();
    }));
  }
}
