import 'package:FoodDeli/pages/account/confirmationCode.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_config.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isHidden = true;
  TextEditingController accountController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Quên mật khẩu',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _gap(),
                const Text(
                  'Chúng tôi sẽ gửi mã xác thực đến email của bạn để đặt lại mật khẩu. Hãy nhập email liên kết với tài khoản của bạn bên dưới.',
                  textAlign: TextAlign.center,
                ),
                _gap(),
                // email
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
                      Icons.email_rounded,
                      color: const Color(0xFF666666),
                      size: AppConfig.defaultIconSize,
                    ),
                    fillColor: const Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: AppFonts.interRegular,
                        fontSize: AppConfig.defaultFontSize),
                    hintText: "Email",
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
                              builder: (context) => const ConfirmationCode()));
                    },
                    child: const Text(
                      "Gửi",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
