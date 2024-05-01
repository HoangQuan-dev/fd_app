import 'package:FoodDeli/pages/forgotPassword.dart';
import 'package:FoodDeli/pages/home_page.dart';
import 'package:FoodDeli/pages/mainPage.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_config.dart';
import 'package:FoodDeli/values/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 230,
                    height: 230,
                    alignment: Alignment.center,
                    child: Image.asset(AppAssets.loginCircle),
                  ),
                  _gap(),
                  TextField(
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
                        color:  const Color(0xFF666666),
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
                  TextField(
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
                        color: Color(0xFF666666),
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
                          MaterialPageRoute(builder: (context) => const ForgotPassword()),
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
                        shape: BoxShape.circle,
                        color: Color(0xFFF2F3F7)
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(17.0)),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFEB8E0E)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(color: Color(0xFFEB8E0E))
                        )),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPage()),
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Bạn chưa có tài khoản? ",
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: AppFonts.interRegular,
                          fontSize: AppConfig.defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => AppSingUp()),
                        // )
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
