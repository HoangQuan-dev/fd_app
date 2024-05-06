import 'package:FoodDeli/pages/account/login.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:flutter/material.dart';

import '../../data/api.dart';
import '../../data/model/user.model.dart';
import '../../data/sharePreferences.dart';
import '../../values/app_config.dart';
import '../../values/app_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isHidden = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp() async {
    User user = (await APIRepository().signUp(
        nameController.text,
        emailController.text,
        genderController.text,
        phoneController.text,
        passwordController.text));

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
    return true;
  }

  void _toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Nam';

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
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: nameController,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                          hintText: "Họ tên",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFD3D3D3),
                        ),
                        hint: const Text('Giới tính'),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: const Color(0xFFF2F3F5),
                            fontFamily: AppFonts.interRegular,
                            fontSize: AppConfig.defaultFontSize),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Nam', 'Nữ', 'Khác']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                _gap(),
                TextField(
                  controller: emailController,
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
                      Icons.email,
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
                TextField(
                  controller: phoneController,
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
                      Icons.phone,
                      color: const Color(0xFF666666),
                      size: AppConfig.defaultIconSize,
                    ),
                    fillColor: const Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: AppFonts.interRegular,
                        fontSize: AppConfig.defaultFontSize),
                    hintText: "Số điện thoại",
                  ),
                ),
                _gap(),
                // password
                TextField(
                  controller: passwordController,
                  obscureText: isHidden ? true : false,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF666666),
                        size: AppConfig.defaultIconSize,
                      ),
                      onPressed: _toggleVisibility,
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
                      signUp();
                    },
                    child: const Text(
                      "Đăng ký",
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
