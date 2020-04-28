import 'package:http/http.dart' as http;

class BeerService {

  /// Punk beer api end-point.
  String api = "https://api.punkapi.com/v2/beers?";

  /// Number of beers per page.
  int resPerPage = 20;

  /// Fetches beers for the page passed.
  Future<String> fetchPage(int pageNum) async {
    if(pageNum == null) return null;

    http.Response res = await http.get("${api}page=$pageNum&per_page=$resPerPage");
    return res?.body;
  }
}