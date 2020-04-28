import 'package:flutter/material.dart';
import 'package:punkbeer/beer_manager.dart';
import 'package:punkbeer/beer_model.dart';

class BeerTile extends StatefulWidget {
  final BeerModel beer;
  const BeerTile({Key key, this.beer}) : super(key: key);

  @override
  _BeerTileState createState() => _BeerTileState();
}

class _BeerTileState extends State<BeerTile> {
  BeerManager beerManager = BeerManager();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.beer.name),
      subtitle: Text(widget.beer.tagLine),
      leading: Image.network(widget.beer.image),
      trailing: IconButton(
        icon: Icon(beerManager.isFav(beerId: widget.beer.id) ? Icons.favorite : Icons.favorite_border),
        onPressed: toggleFav,
      ),
    );
  }

  void toggleFav() async {
    await beerManager.toggleFav(beerId: widget.beer.id);
    setState(() {});
  }
}
