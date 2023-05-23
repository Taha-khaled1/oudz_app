import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/data_layer/models/cart_model.dart';
import 'package:oudz_app/data_layer/models/favorit_model.dart';
import 'package:oudz_app/data_layer/models/product_model.dart';
import 'package:oudz_app/main.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/handlingView/handlingview.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/msnge_api.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/controller/home_controller.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/product_detalis_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resources/styles_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
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
        appBar: appbarscreen('Homepage'.tr),
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
                  // Titelmore(
                  //   text1: 'عطور رجاليه',
                  //   text2: 'المزيد',
                  //   onTap: () {
                  //     Get.to(() => const MoreProductScreen());
                  //   },
                  // ),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: controller.statusRequest1,
                        widget: Wrap(
                          children: [
                            for (int i = 0;
                                i <
                                    (controller
                                            .productModelstow?.data?.length ??
                                        0);
                                i++)
                              ProductCard(
                                data: controller.productModelstow?.data?[i],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Titelmore(
                  //   text1: 'عطور نسائيه',
                  //   text2: 'المزيد',
                  //   onTap: () {
                  //     Get.to(() => const MoreProductScreen());
                  //   },
                  // ),
                  // Wrap(
                  //   children: [
                  //     for (int i = 0; i < 4; i++) const ProductCard(),
                  //   ],
                  // ),
                  // Titelmore(
                  //   text1: 'عطور جميله',
                  //   text2: 'المزيد',
                  //   onTap: () {
                  //     Get.to(() => const MoreProductScreen());
                  //   },
                  // ),
                  // Wrap(
                  //   children: [
                  //     for (int i = 0; i < 4; i++) const ProductCard(),
                  //   ],
                  // ),
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
    required this.data,
  });
  final Data? data;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetalis(), arguments: {'data': data});
      },
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 8.5),
        width: 170,
        height: 310,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                data!.image ?? '',
                fit: BoxFit.cover,
                width: 400,
                height: 210,
              ),
            ),
            Text(
              data!.name ?? '',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.ktextblackk,
                fontSize: FontSize.s18,
              ),
            ),
            Text(
              '${data!.price} درهم',
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
                  onTap: () async {
                    // await sqlDb?.fordeletedatabase();
                    CartItem cartItem = CartItem(
                      des: data!.description ?? '',
                      itemsName: data!.name ?? '',
                      itemsNameEn: data!.nameEn ?? '',
                      itemsImage: data!.image ?? '',
                      itemsPrice: data!.price ?? 1,
                      id: data!.id ?? 1,
                      count: 1,
                    );
                    controller.addcart(context, cartItem);
                  },
                  child: Image.asset(
                    'assets/images/shopping-cart.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    Future<bool> isFavorite =
                        controller.isProductInFavorites(data!.id ?? 1);
                    return InkWell(
                      onTap: () {
                        FavoritModel favoritModel = FavoritModel(
                          id: data!.id ?? 1,
                          des: data!.description ?? '',
                          price: data!.price ?? 1,
                          titleEn: data!.nameEn ?? '',
                          title: data!.name ?? '',
                          image: data!.image ?? '',
                        );
                        controller.addfavorite(context, favoritModel);
                      },
                      child: FutureBuilder<bool>(
                        future: controller.isProductInFavorites(data!.id ?? 1),
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
                                    color: Colors.grey,
                                  );
                          }
                        },
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
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
