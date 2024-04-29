import 'package:FoodDeli/pages/home_page.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:FoodDeli/values/app_fonts.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: AppColors.primaryColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.loginCircle,
                    width: 300,
                  ),
                  _gap(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "IMMEDELI CHÀO BẠN",
                      style: TextStyle(
                        fontFamily: AppFonts.bmdaniel,
                        fontSize: 25,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0),
                  //   child: Text(
                  //     'Enter your email and password to continue.',
                  //     style: Theme.of(context).textTheme.bodySmall,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  _gap(),
                  TextFormField(
                    cursorColor: AppColors.whiteColor,
                    style: const TextStyle(color: AppColors.whiteColor),
                    validator: (value) {
                      // add email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);

                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.whiteColor),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: AppColors.whiteColor),
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixStyle: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      prefixIconColor: AppColors.whiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ), // Set outline color to white
                      ),
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    cursorColor: AppColors.whiteColor,
                    style: const TextStyle(
                        color: AppColors.whiteColor,
                        decorationColor: AppColors.whiteColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: AppColors.whiteColor),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: AppColors.whiteColor),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      prefixIconColor: AppColors.whiteColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      suffixIconColor: AppColors.whiteColor,
                      suffixStyle: const TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  _gap(),
                  CheckboxListTile(
                    value: _rememberMe,
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        width: 2.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    selectedTileColor: AppColors.whiteColor,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _rememberMe = value;
                      });
                    },
                    title: const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  _gap(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor: AppColors.secondaryColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
