import 'package:FoodDeli/data/model/product.model.dart';
import 'package:FoodDeli/data/provider/cartProvider.dart';
import 'package:FoodDeli/pages/order/order.dart';
import 'package:FoodDeli/pages/widgets/customAppBarNoCart.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Giỏ hàng",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: AppAssets.products.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(AppAssets.products[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  AppAssets.products.removeAt(index);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever_rounded),
                    )
                  ],
                ),
              ),
              child: cartCard(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: checkOutCart(),
    );
  }

  Widget cartCard() {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppAssets.avatar),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prod title',
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "20,000đ",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                children: [
                  TextSpan(
                      text: " x1",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget checkOutCart() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(AppAssets.voucher),
                ),
                const Spacer(),
                const Text("Áp mã khuyến mãi"),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.secondaryColor,
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Tổng:\n",
                      children: [
                        TextSpan(
                          text: "20,000đ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("ĐẶT HÀNG"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemListView(Product prod) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Image.network(
              prod.image!,
              height: 120,
              width: 120,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  prod.name!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  NumberFormat('###,###.###đ').format(prod.price),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (prod.quantity != 0 && prod.quantity > 0) {
                        prod.quantity -= 1;
                        Provider.of<CartProvider>(context, listen: false)
                            .notifyListeners();
                      }
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: AppColors.primaryColor,
                    ),
                    padding: EdgeInsets.all(1),
                  ),
                  Text(
                    prod.quantity.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      if (prod.quantity != 0 && prod.quantity! > 0) {
                        prod.quantity += 1;
                        Provider.of<CartProvider>(context, listen: false)
                            .notifyListeners();
                      }
                    },
                    icon: const Icon(Icons.add_circle),
                    color: AppColors.primaryColor,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
