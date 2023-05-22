import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/main.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:oudz_app/presentation_layer/screen/favorit_screen/favorit_screen.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/controller/home_controller.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:oudz_app/presentation_layer/screen/more_catogery/more_catogery.dart';

class Navb extends StatelessWidget {
  const Navb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIcon(
            svg: 'assets/icons/home (1).png',
            title: 'الرئيسيه',
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
          CustomIcon(
            svg: 'assets/icons/category.png',
            title: 'التصنيفات',
            onTap: () {
              Get.to(() => const MoreCatogeryScreen());
            },
          ),
          Stack(
            children: [
              CustomIcon(
                svg: 'assets/icons/bag.png',
                title: 'عربة التسوق',
                onTap: () {
                  Get.to(() => const CartScreen());
                },
              ),

              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return FutureBuilder<int>(
                    future: controller.getCartProductCount(),
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Future is still loading, return a placeholder widget or loading indicator
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // An error occurred while fetching the favorite status
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Favorite status is available
                        int count = snapshot.data ??
                            0; // Use a default value if data is null

                        return Positioned(
                          top: 0,
                          right: 8,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorManager.kPrimary,
                            child: Text(
                              count.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),

              // Container(
              //   width: 30,
              //   height: 20,
              //   child:
              // ),
            ],
          ),
          CustomIcon(
            svg: 'assets/icons/heart.png',
            title: 'المفضله',
            onTap: () {
              Get.to(() => const FavoritScreen());
            },
          ),
          CustomIcon(
            svg: 'assets/icons/avatar.png',
            title: 'الحساب',
            onTap: () {
              Get.to(() => const AccountScreen());
            },
          ),
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.svg,
    required this.title,
    required this.onTap,
  });
  final String svg, title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            svg,
            width: 30,
            height: 30,
          ),
          // SvgPicture.asset(
          //   svg,
          //   width: 30,
          //   height: 30,
          // ),
          Text(title)
        ],
      ),
    );
  }
}
