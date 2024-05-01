class Product {
  String? id;
  String? name;
  String? description;
  String? image;
  int quantity;
  int? price;
  List<String>? size; // Thay đổi từ String? thành List<String>?
  String? cat_id;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.quantity,
    required this.price,
    required this.size,
    required this.cat_id,
  });
  static List<Product> productEmpty() {
    return [
      Product(
        id: '',
        name: '',
        description: '',
        image: '',
        quantity: 0,
        price: 0,
        size: [],
        cat_id: '',
      )
    ];
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image:
            json["image"] == null || json["image"] == '' ? "" : json['image'],
        quantity: json["quantity"],
        price: json["price"],
        size: List<String>.from(json["size"].map((x) => x)),
        cat_id: json["cat_id"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['quantity'] = quantity;
    data['price'] = price;
    data['size'] = size!.map((x) => x).toList();
    data['cat_id'] = cat_id;

    return data;
  }
}
