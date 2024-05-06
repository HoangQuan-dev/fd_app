import 'package:FoodDeli/pages/account/login.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:FoodDeli/values/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ẩn thanh ngày giờ của hệ thống
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Material(
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FOOD",
                style: TextStyle(
                  fontFamily: AppFonts.bmdaniel,
                  fontSize: 70,
                  color: Colors.white,
                  height: 0.8,
                ),
              ),
              Text(
                "IMMEDELI",
                style: TextStyle(
                  fontFamily: AppFonts.bmdaniel,
                  fontSize: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NÓNG GIÒN ĐÂY!",
                style: TextStyle(
                  fontFamily: AppFonts.interLight,
                  fontSize: 30,
                  color: Colors.white,
                  height: 0.8,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 90),
            child: Image.asset(
              AppAssets.appLogo,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
