import 'package:flutter/material.dart';
import 'package:punkbeer/beer_model.dart';
import 'package:punkbeer/managers/fav_manager.dart';

class BeerTile extends StatefulWidget {
  final BeerModel beer;
  const BeerTile({Key key, this.beer}) : super(key: key);

  @override
  _BeerTileState createState() => _BeerTileState();
}

class _BeerTileState extends State<BeerTile> {
  FavManager favManager = FavManager();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.beer.name),
      subtitle: Text(widget.beer.tagLine),
      leading: Image.network(widget.beer.image),
      trailing: IconButton(
        icon: Icon(favManager.isFav(beer: widget.beer) ? Icons.favorite : Icons.favorite_border),
        onPressed: toggleFav,
      ),
    );
  }

  void toggleFav() async {
    await favManager.toggleFav(beer: widget.beer);
    setState(() {});
  }
}
