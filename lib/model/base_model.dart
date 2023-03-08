class Product {
  late final int id;
  late final String name;
  late final String imgUrl;
  late final double price;
  late final double rate;
  late final double star;
  late int value;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rate,
    required this.star,
    required this.value,
    required this.imgUrl,
  }
  );
}