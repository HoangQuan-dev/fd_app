import 'dart:convert';

import 'package:FoodDeli/data/api.dart';
import 'package:FoodDeli/data/model/user.model.dart';
import 'package:FoodDeli/data/sharePreferences.dart';
import 'package:FoodDeli/pages/account/login.dart';
import 'package:FoodDeli/pages/payment/success.dart';
import 'package:FoodDeli/pages/user/editProfile.dart';
import 'package:FoodDeli/pages/user/profileWidget.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user = User.userEmpty();
  bool isAvatarLoading = true;
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;
    user = User.fromJson(jsonDecode(strUser));
    setState(() {
      isAvatarLoading = false;
    });
  }

  void payByVnpay() async {
    try {
      String paymentUrl = await APIRepository().createPaymentUrl(
        amount: 25000,
      );
      if (await canLaunch(paymentUrl)) {
        await launch(paymentUrl);
        await Future.delayed(const Duration(seconds: 3));
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentSuccess(),
          ),
        );
      } else {
        throw 'Could not launch $paymentUrl';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: isAvatarLoading
                          ? const CircularProgressIndicator()
                          : Image.network(user.avatar!),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.primaryColor),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                user.name!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_rounded,
                    color: Colors.amber,
                  ),
                  Text(
                    'Thành viên Vàng',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileWidget(
                title: "Cài đặt tài khoản",
                icon: Icons.settings,
                onPress: () {
                  payByVnpay();
                },
              ),
              ProfileWidget(
                title: "Chi tiết hóa đơn",
                icon: Icons.wallet,
                onPress: () {},
              ),
              ProfileWidget(
                title: "Quản lý cá nhân",
                icon: Icons.person,
                onPress: () {},
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileWidget(
                title: "Thông tin",
                icon: Icons.info,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
              ),
              ProfileWidget(
                title: 'Đăng xuất',
                icon: Icons.logout,
                textColor: Colors.red,
                onPress: () {
                  logOut(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
