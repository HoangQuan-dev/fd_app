import 'dart:convert';

import 'package:FoodDeli/data/model/product.model.dart';
import 'package:FoodDeli/data/model/user.model.dart';
import 'package:dio/dio.dart';

import 'model/category.model.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = 'https://fd-server-rjrz.onrender.com';

  API() {
    _dio.options.baseUrl = '$baseUrl/api/v1';
  }

  Dio get sendRequest => _dio;
}

class APIRepository {
  API api = API();

  Map<String, dynamic> header() {
    return {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
  }

  Future<User> login(String emailOrPhone, String password) async {
    try {
      Response res = await api.sendRequest.post('/login',
          data: jsonEncode(<String, String>{
            'emailOrPhone': emailOrPhone,
            'password': password,
          }),
          options: Options(headers: header()));
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        throw Exception('Failed to login');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<User> signUp(String name, String gender, String email, String phone,
      String password) async {
    try {
      Response res = await api.sendRequest.post('/add',
          data: jsonEncode(<String, String>{
            'name': name,
            'gender': gender,
            'email': email,
            'phone': phone,
            'password': password,
          }),
          options: Options(headers: header()));
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<Category>> getCategory() async {
    try {
      Response res = await api.sendRequest
          .get('/categories', options: Options(headers: header()));
      if (res.data is List) {
        return (res.data as List)
            .map((item) => Category.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Data is not a list');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<Product>> getProduct() async {
    try {
      Response res = await api.sendRequest
          .get('/products', options: Options(headers: header()));
      if (res.data is List) {
        print('product: ${res.data}');
        return (res.data as List)
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Data is not a list');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<String> createPaymentUrl({
    required double amount,
  }) async {
    try {
      Response res = await api.sendRequest.post(
        '/payment/create_payment_url',
        data: jsonEncode(<String, String>{
          'amount': amount.toString(),
          'bankCode': 'ncb',
          'orderDescription': 'Thanh toán đơn hàng ngày: ${DateTime.now()}',
          'orderType': 'other',
          'language': 'vn',
        }),
        options: Options(headers: header()),
      );

      if (res.statusCode == 200) {
        return res.data;
      } else {
        throw Exception('Failed to create payment URL');
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
