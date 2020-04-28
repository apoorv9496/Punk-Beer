import 'package:http/http.dart' as http;

class BeerService {

  String api = "https://api.punkapi.com/v2/beers?";
  int resPerPage = 20;

  Future<String> fetchPage(int pageNum) async {
    if(pageNum == null) return null;

    http.Response res = await http.get("${api}page=$pageNum&per_page=$resPerPage");
    return res?.body;
  }
}