import 'package:flutter/material.dart';
import 'package:punkbeer/beer_manager.dart';
import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/beer_tile.dart';
import 'package:punkbeer/fav_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BeerManager beerManager = BeerManager();
  int currPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Punk Beer"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: showFavs),
        ],
      ),
      body: StreamBuilder<List<BeerModel>>(
        stream: beerManager.fetchPage(currPage),
        builder: (context, snapshot) {

          List<BeerModel> beers = snapshot.data;

          return NotificationListener(
            onNotification: (notif) {
              if(notif is ScrollEndNotification) {
                print(notif.metrics.atEdge);
                print(notif.metrics.maxScrollExtent);
                print(notif.metrics.pixels);

                if(notif.metrics.atEdge) {
                  setState(() {
                    currPage++;
                  });
                }
              }

              return true;
            },
            child: ListView.builder(
              itemCount: beers.length,
              itemBuilder: (context, index) => BeerTile(beer: beers[index],),
            ),
          );
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
