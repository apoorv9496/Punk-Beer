class BeerModel {

  int id;
  String name;
  String image;
  String desc;
  String tagLine;
  String firstBrewed;

  BeerModel.fromJson(Map<String, dynamic> data) {
    this.id = data["id"];
    this.name = data["name"];
    this.image = data["image_url"];
    this.desc = data["description"];
    this.tagLine = data["tag_line"];
    this.firstBrewed = data["first_brewed"];
  }
}