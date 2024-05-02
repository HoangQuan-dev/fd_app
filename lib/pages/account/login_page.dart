import 'package:FoodDeli/data/api.dart';
import 'package:FoodDeli/data/model/user.model.dart';
import 'package:FoodDeli/pages/account/forgotPassword.dart';
import 'package:FoodDeli/pages/homePage.dart';
import 'package:FoodDeli/pages/mainPage.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_config.dart';
import 'package:FoodDeli/values/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../data/sharePreferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() async {
    User user = (await APIRepository()
        .login(accountController.text, passwordController.text)) as User;

    // save share
    saveUser(user);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 350),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 230,
                  height: 230,
                  alignment: Alignment.center,
                  child: Image.asset(AppAssets.loginCircle),
                ),
                _gap(),
                // account
                TextField(
                  controller: accountController,
                  showCursor: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: const Color(0xFF666666),
                      size: AppConfig.defaultIconSize,
                    ),
                    fillColor: const Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: AppFonts.interRegular,
                        fontSize: AppConfig.defaultFontSize),
                    hintText: "Email/Số điện thoại",
                  ),
                ),
                _gap(),
                // password
                TextField(
                  controller: passwordController,
                  showCursor: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: const Color(0xFF666666),
                      size: AppConfig.defaultIconSize,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: const Color(0xFF666666),
                      size: AppConfig.defaultIconSize,
                    ),
                    fillColor: const Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                      color: const Color(0xFF666666),
                      fontFamily: AppFonts.interRegular,
                      fontSize: AppConfig.defaultFontSize,
                    ),
                    hintText: "Mật khẩu",
                  ),
                ),
                _gap(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerRight,
                    ),
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: AppFonts.interRegular,
                        fontSize: AppConfig.defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                _gap(),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(17.0)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFEB8E0E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: Color(0xFFEB8E0E)))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                      );
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: AppFonts.interRegular,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Bạn chưa có tài khoản? ",
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: AppFonts.interRegular,
                          fontSize: AppConfig.defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => AppSingUp()),
                          // )
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: const Color(0xFFEB8E0E),
                            fontFamily: AppFonts.interRegular,
                            fontSize: AppConfig.defaultFontSize,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
