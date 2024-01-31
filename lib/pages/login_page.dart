import 'package:fd_app/values/app_assets.dart';
import 'package:fd_app/values/app_colors.dart';
import 'package:fd_app/values/app_fonts.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.loginCircle,
            width: 400,
          ),
          const Text(
            "IMMEDELI CHÀO BẠN",
            style: TextStyle(
              fontFamily: AppFonts.bmdaniel,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const Text(
            "Nhập số điện thoại của bạn để tiếp tục nhé",
            style: TextStyle(
              fontFamily: AppFonts.interRegular,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: false,
                hintText: 'Số điện thoại',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
          ),
          const Text(
            "Để sau nhé, mình muốn xem thêm chút nữa",
            style: TextStyle(
              fontFamily: AppFonts.interRegular,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppAssets.bannerLogin,
              width: 330,
            ),
          )
        ],
      ),
    );
  }
}
