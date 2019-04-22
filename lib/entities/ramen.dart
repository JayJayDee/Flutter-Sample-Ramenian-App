
enum RamenType {
  SoupLess, Soupful, WhiteSoup
}

class Ramen {
  RamenType _type;
  String _name;
  int _price;

  RamenType get type => _type;
  String get name => _name;
  int get price => _price;
}