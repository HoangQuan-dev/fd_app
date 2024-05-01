class Category {
  String? id;
  String? name;
  String? description;
  String? image;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
  static List<Category> categoryEmpty() {
    return [
      Category(
        id: '',
        name: '',
        description: '',
        image: '',
      )
    ];
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"] == null || json["image"] == ''
        ? ""
        : json['image'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;

    return data;
  }
}
