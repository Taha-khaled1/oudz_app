import 'package:oudz_app/data_layer/models/cart_model.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/widget/cart_card.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/controller/home_controller.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/product_detalis_controller/product_detalis_controller.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/widget/ImageWithBackButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetalis extends StatelessWidget {
  const ProductDetalis({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetalisController controllerpro =
        Get.put(ProductDetalisController());

    return Scaffold(
      bottomNavigationBar: const Navb(),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWithBackButton(img: '${controllerpro.data.image}'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controllerpro.data.name ?? '',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.ktextblackk,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: FutureBuilder<bool>(
                          future: controllerpro
                              .isProductInFavorites(controllerpro.data.id ?? 1),
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Future is still loading, return a placeholder widget or loading indicator
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // An error occurred while fetching the favorite status
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // Favorite status is available
                              bool favorite = snapshot.data ??
                                  false; // Use a default value if data is null

                              return favorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 32,
                                    )
                                  : Icon(
                                      Icons.favorite_outline,
                                      size: 32,
                                    );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${controllerpro.data.description}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (controller) {
                          return CustomButton(
                            width: 185,
                            haigh: 60,
                            color: ColorManager.kPrimary,
                            text: 'اضافة الي السله',
                            press: () {
                              CartItem cartItem = CartItem(
                                des: controllerpro.data.description ?? '',
                                itemsName: controllerpro.data.name ?? '',
                                itemsNameEn: controllerpro.data.nameEn ?? '',
                                itemsImage: controllerpro.data.image ?? '',
                                itemsPrice: controllerpro.data.price ?? 1,
                                id: controllerpro.data.id ?? 1,
                                count: 1,
                              );
                              controller.addcart(context, cartItem);
                            },
                          );
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffAA5908)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          '\$${controllerpro.data.price}',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary2,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GetBuilder<ProductDetalisController>(
                    init: ProductDetalisController(),
                    builder: (controller) {
                      return IncrasingorDecrasing(
                        fontsize: 25,
                        count: controller.count,
                        size: 30,
                        onTapAdd: () {
                          controller.icrasingCount();
                        },
                        onTapmuns: () {
                          controller.decrasingCount();
                        },
                      );
                    },
                  ),
                  Text(
                    '',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary2,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
