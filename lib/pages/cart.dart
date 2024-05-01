import 'package:FoodDeli/data/model/product.model.dart';
import 'package:FoodDeli/pages/cartProvider.dart';
import 'package:FoodDeli/pages/order.dart';
import 'package:FoodDeli/pages/widgets/customAppBarNoCart.dart';
import 'package:FoodDeli/values/app_assets.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';
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
      appBar: customAppBarNoCart(context, 'Giỏ hàng', AppColors.primaryColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return itemListView(cart.items[index]);
                },
              ),
              const SizedBox(height: 250),
              // Container(
              //   color: const Color(0xFFF5F3F3),
              //   padding: const EdgeInsets.all(8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text('TỔNG TIỀN : 132.000đ',
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           )),
              //       Row(
              //         children: [
              //           SizedBox(
              //             width: 130,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(4)),
              //                 backgroundColor: const Color(0xFFFC6B15),
              //               ),
              //               child: const Padding(
              //                 padding: EdgeInsets.all(2),
              //                 child: Text(
              //                   'XÁC NHẬN',
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.bold,
              //                     color: AppColors.whiteColor,
              //                   ),
              //                 ),
              //               ),
              //               onPressed: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => const Order(),
              //                   ),
              //                 );
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
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
                  // 'Price: ${NumberFormat('###,###.###').format(prod.price)}',
                  '${prod.price}đ',
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (prod.quantity != 0 && prod.quantity! > 0) {
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
                  const Text(
                    '1', // số lượng của item product
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
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
