import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/screen/more_product/more_product.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/widget/Titelmore.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/product_detalis_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/styles_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget>? items = [
      Image.asset('assets/images/logo.jpg'),
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Image.asset('assets/images/whatsapp.png'),
          onPressed: () async {
            String phoneNumber =
                "9710501009004"; // replace this with the desired phone number
            String url = "https://api.whatsapp.com/send?phone=$phoneNumber";
            await _launchUrl(url);
          },
        ),
        backgroundColor: ColorManager.background,
        appBar: appbarscreen('الصفحه الرئيسيه'),
        bottomNavigationBar: const Navb(),
        body: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    // child: Carousel(
                    //   images: [
                    //     NetworkImage(
                    //         'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                    //     NetworkImage(
                    //         'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                    //     ExactAssetImage("assets/images/REO.png")
                    //   ],
                    // ),
                  ),
                  Titelmore(
                    text1: 'عطور رجاليه',
                    text2: 'المزيد',
                    onTap: () {
                      Get.to(() => const MoreProductScreen());
                    },
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < 4; i++) const ProductCard(),
                    ],
                  ),
                  Titelmore(
                    text1: 'عطور نسائيه',
                    text2: 'المزيد',
                    onTap: () {
                      Get.to(() => const MoreProductScreen());
                    },
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < 4; i++) const ProductCard(),
                    ],
                  ),
                  Titelmore(
                    text1: 'عطور جميله',
                    text2: 'المزيد',
                    onTap: () {
                      Get.to(() => const MoreProductScreen());
                    },
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < 4; i++) const ProductCard(),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetalis());
      },
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 8.5),
        width: 170,
        height: 310,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/perfum.jpg',
                fit: BoxFit.fitHeight,
                height: 210,
              ),
            ),
            Text(
              'عطر وايت عود',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.ktextblackk,
                fontSize: FontSize.s18,
              ),
            ),
            Text(
              '180 درهم',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.ktextblackk,
                fontSize: FontSize.s18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/shopping-cart.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/heart.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
