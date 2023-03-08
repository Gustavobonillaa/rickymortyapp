class Ryckymorty {
  late int id;
  late String name;

  late String image;

  Ryckymorty.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];
}
