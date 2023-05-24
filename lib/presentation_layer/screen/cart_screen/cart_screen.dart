import 'package:oudz_app/data_layer/models/cart_model.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/strings_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/widget/cart_card.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/widget/final_price.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen(
        AppStrings.cart.tr,
      ),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<CartController>(
            builder: (controller) {
              return Column(
                children: [
                  controller.islooding
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                            itemCount: controller.cartItem.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartCard(
                                cart: controller.cartItem[index],
                                index: index,
                              );
                            },
                          ),
                        ),
                  BottomSection(
                    width: deviceInfo.localWidth * 0.85,
                  ),
                  CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: AppStrings.confirmation.tr,
                    press: () {},
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Divider(
            thickness: 2,
          ),
          GetBuilder<CartController>(
            builder: (controller) {
              return Column(
                children: [
                  FinalPrice(
                    title: AppStrings.subtotal.tr,
                    price: controller.totelPrice.toString(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FinalPrice(
                    title: AppStrings.tax.tr,
                    price: controller.totelTex.toString(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppStrings.select_delivery_type.tr,
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CachCard(
                        controller: controller,
                        width: width,
                        text: AppStrings.home_delivery.tr,
                        valuebut: 'توصيل منزلي',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CachCard(
                        controller: controller,
                        width: width,
                        text: AppStrings.online_payment.tr,
                        valuebut: 'الدفع الكتروني',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CachCard extends StatelessWidget {
  const CachCard({
    super.key,
    required this.width,
    required this.text,
    required this.controller,
    required this.valuebut,
  });
  final double width;
  final String text, valuebut;
  final CartController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: width,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: ColorManager.grey2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.kPrimary),
      ),
      child: Row(
        children: [
          Radio(
            value: valuebut,
            groupValue: controller.deliveryType,
            onChanged: (value) {
              controller.updatePay(value!);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.ktextblackk,
              fontSize: FontSize.s18,
            ),
          ),
        ],
      ),
    );
  }
}
