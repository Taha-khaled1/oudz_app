import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
import 'package:oudz_app/presentation_layer/screen/cart_screen/widget/cart_card.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/widget/Titelmore.dart';
import 'package:oudz_app/presentation_layer/screen/more_product/more_product.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/product_detalis_controller/product_detalis_controller.dart';
import 'package:oudz_app/presentation_layer/screen/product_detalis/widget/ImageWithBackButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetalis extends StatelessWidget {
  const ProductDetalis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navb(),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageWithBackButton(),
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
                        'دهن عود زمان أول',
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
                        child: const Icon(Icons.favorite_outline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    ''' 
قد تتعمد الكثير من الدول إنشاء المحميات الطبيعية التي يعدونها بوجه خاص من أجل حماية الحيوانات سيما تلك القابلة للانقراض بسبب التناقص الكبير في أعدادها، جراء الرعي الجائر أو العديد من الممارسات الخاطئة التي تتسبب بموتها وأحيانًا تكون بأعداد كبيرة لا يمكن حصرها، ويكون ذلك نتيجةً لإهمال الكثيرين الذين يتعمدون إلقاء النفايات والعوادم في مناطق زراعية أو بيئات حيوانية فتتعفن تلك القاذورات وتتحول لمواد سامة تنتشر في مساحات شاسعة ومنها ما ينحصر ويذوي تحت الأرض، فيتحول
                ''',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        width: 185,
                        haigh: 60,
                        color: ColorManager.kPrimary,
                        text: 'اضافة الي السله',
                        press: () {},
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
                          '\$199',
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
            Titelmore(
              text1: 'تسوق منتجاتنا',
              text2: 'المزيد',
              onTap: () {
                Get.to(() => const MoreProductScreen());
              },
            ),
            SizedBox(
              height: 320,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
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
