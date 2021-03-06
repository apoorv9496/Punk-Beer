import 'dart:convert';

class BeerModel {

  int id;
  String name;
  String image;
  String desc;
  String tagLine;
  String firstBrewed;

  BeerModel.fromJson(Map<String, dynamic> data) {
    this.id = data["id"] ?? 0;
    this.name = data["name"] ?? "";
    this.image = data["image_url"] ?? "";
    this.desc = data["description"] ?? "";
    this.tagLine = data["tagline"] ?? "";
    this.firstBrewed = data["first_brewed"] ?? "";
  }

  toJson() {
    return json.encode({
      "id": this.id,
      "name": this.name,
      "image_url": this.image,
      "description": this.desc,
      "tagline": this.tagLine,
      "first_brewed": this.firstBrewed,
    });
  }
}