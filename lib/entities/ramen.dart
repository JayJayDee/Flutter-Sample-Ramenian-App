enum RamenType {
  SoupLess, Soupful, WhiteSoup
}

class Ramen {
  RamenType _type;
  String _name;
  String _company;
  String _image;
  bool _soup;
  List<String> _tags;

  Ramen();

  RamenType get type => _type;
  String get name => _name;
  String get company => _company;
  String get image => _image;
  List<String> get tags => _tags;
  bool get hasSoup => _soup;

  factory Ramen.fromJson(Map<String, dynamic> json) {
    Ramen ramen = Ramen();
    ramen._company = json['company'];
    ramen._name = json['name'];
    ramen._image = json['image'];
    ramen._soup = json['soup'];
    List<dynamic> tagsRaw = json['tags'];
    List<String> tags = tagsRaw.map((t) => t.toString()).toList();
    ramen._tags = tags;
    return ramen;
  }
}