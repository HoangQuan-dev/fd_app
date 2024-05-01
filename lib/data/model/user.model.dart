class User {
  String? id;
  String? name;
  String? gender;
  String? birthDay;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? avatar;
  int? createdAt;
  bool? status;

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.avatar,
    required this.createdAt,
    required this.status,
  });
  static User userEmpty() {
    return User(
        id: '',
        name: '',
        gender: '',
        birthDay: '',
        email: '',
        phone: '',
        password: '',
        address: '',
        avatar: '',
        createdAt: 0,
        status: false,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    birthDay: json["birthDay"],
    email: json["email"],
    avatar: json["avatar"] == null || json["avatar"] == ''
        ? ""
        : json['avatar'],
    phone: json["phone"],
    password: json["password"],
    address: json["address"],
    createdAt: json["createdAt"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['birthDay'] = birthDay;
    data['email'] = email;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['password'] = password;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['status'] = status;

    return data;
  }
}
