// import 'dart:convert';

// import 'package:FoodDeli/data/model/category.model.dart';
// import 'package:flutter/services.dart';

// class ReadData {
//   Future<List<Category>> loadData() async {
//     var data =
//         await rootBundle.loadString('http://localhost:3500/api/v1/categories');
//     var dataJson = jsonDecode(data);
//     print(dataJson);
//     return (dataJson['data'] as List).map((e) => Category.fromJson(e)).toList();
//   }
// }
