import 'package:FoodDeli/data/model/category.model.dart';
import 'package:FoodDeli/data/model/product.model.dart';

class AppAssets {
  static const String imagePath = 'assets/images';
  static const String catPath = 'assets/images/categories';
  static const String prodPath = 'assets/images/products';
  static const String iconPath = 'assets/icons';

  static const String appLogo = '$imagePath/logo.jpg';
  static const String loginCircle = '$imagePath/login_circle.jpg';
  static const String bannerLogin = '$imagePath/banner_login.jpg';
  static const String feet = '$imagePath/feet.png';
  static const String shipper = '$imagePath/shipper.jpg';
  static const String avatar = '$imagePath/avt.png';
  static const String flashsale = '$iconPath/flashsale.png';

  static const String banners = '$imagePath/banners';

  static final List<Category> categories = [
    const Category('Cơm', '$catPath/com.png'),
    const Category('Phở', '$catPath/pho.png'),
    const Category('Đồ uống', '$catPath/douong.png'),
    const Category('Đồ ăn nhanh', '$catPath/doannhanh.png'),
    const Category('Ăn vặt', '$catPath/anvat.png'),
    const Category('Hải sản', '$catPath/haisan.png'),
    const Category('Healthy', '$catPath/healthy.png'),
    const Category('Món quốc tế', '$catPath/monquocte.png'),
  ];

  static final List<Product> products = [
    const Product('Cơm gà Hải Nam', '$prodPath/comga.jpg', 47000),
    // const Product('Bún đậu Sư Vạn Hạnh', '$prodPath/bundau.jpg'),
    const Product(
        'Hamburger Chú Ba', '$prodPath/hamburger_bosotieuden.jpg', 55000),
    // const Product('TocoToco Sư Vạn Hạnh', '$prodPath/trasuaa.jpg'),
    const Product('Bún thịt nướng 889', '$prodPath/bunthit.jpg', 30000),
  ];

  static final List<Product> hamburgers = [
    const Product('Hamburger Bò sốt tiêu đen',
        '$prodPath/hamburger_bosotieuden.jpg', 55000),
    const Product('Hamburger Gà', '$prodPath/hamburger_gacrop.jpg', 50000),
    const Product('Hamburger Hải sản', '$prodPath/hamburger_haisan.jpg', 75000),
    const Product(
        'Hamburger Tôm hùm', '$prodPath/hamburger_tomhumcrop.jpg', 80000),
    const Product(
        'Hamburger Trứng', '$prodPath/hamburger_trungcrop.jpg', 40000),
  ];
}
