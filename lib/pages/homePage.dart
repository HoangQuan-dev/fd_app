import 'package:FoodDeli/data/api.dart';
import 'package:FoodDeli/data/model/category.model.dart';
import 'package:FoodDeli/data/model/product.model.dart';
import 'package:FoodDeli/data/provider/cartProvider.dart';
import 'package:FoodDeli/pages/product/productDetail.dart';
import 'package:FoodDeli/pages/widgets/bannerCarousel.dart';
import 'package:FoodDeli/pages/widgets/riceCarousel.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = Category.categoryEmpty();
  List<Product> products = Product.productEmpty();
  bool isLoading = true;
  bool isLoadingProd = true;

  getCategory() async {
    categories = (await APIRepository().getCategory());
    setState(() {
      isLoading = false;
    });
  }

  getProduct() async {
    products = (await APIRepository().getProduct());
    setState(() {
      isLoadingProd = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategory();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  hintText: 'Tìm nhà hàng, món ăn...',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColors.primaryColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
            bannerCarousel(),
            const SizedBox(height: 14.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1.0,
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      children: categories.map(_buildFoodCategoryItem).toList(),
                    ),
            ),
            const SizedBox(height: 14.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1.0,
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Image.asset(AppAssets.flashsale),
                  const SizedBox(height: 8.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Khao bạn bữa trưa cuối năm chỉ 20k',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: isLoadingProd
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 260,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Image.network(
                                                  products[index].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            products[index].name!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              NumberFormat('#,##0đ').format(
                                                  products[index]
                                                      .price!
                                                      .toInt()),
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.add_shopping_cart),
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                  context,
                                                  listen: false,
                                                ).add(
                                                  products[index],
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            251, 235, 143, 14),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    content: const Text(
                                                      'Đã thêm vào giỏ hàng',
                                                    ),
                                                    duration: const Duration(
                                                        seconds: 2),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    '${AppAssets.banners}/bannerburger.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1.0,
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Ăn cơm gì lạ hôm nay?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  riceCarousel(),
                  const SizedBox(height: 14.0),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          '${AppAssets.banners}/bannerhealthy.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCategoryItem(Category category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetail(),
          ),
        );
      },
      child: Center(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Flexible(
                flex: 2,
                child: Image.network(category.image!, height: 60.0),
              ),
              const SizedBox(height: 4.0),
              Flexible(
                flex: 1,
                child: Text(category.name!,
                    style: const TextStyle(fontSize: 12.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
