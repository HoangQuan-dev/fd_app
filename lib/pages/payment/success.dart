import 'package:FoodDeli/pages/mainPage.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(35),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/system/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 12),
            const Text(
              "Foodeli cảm ơn bạn!",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Đơn hàng của bạn đã thanh toán thành công và sẽ được chuyển đến bạn trong vài phút nữa.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            // SizedBox(height: screenHeight * 0.05),
            // Text(
            //   "You will be redirected to the home page shortly\nor click here to return to home page",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.black54,
            //     fontWeight: FontWeight.w400,
            //     fontSize: 14,
            //   ),
            // ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                    child: Text(
                      'Trở về Trang chủ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
