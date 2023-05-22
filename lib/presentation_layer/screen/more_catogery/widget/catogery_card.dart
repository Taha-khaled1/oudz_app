import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/data_layer/models/catogery_model.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/msnge_api.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/more_product/more_product.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({super.key, required this.catogery});
  final Categories catogery;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const MoreProductScreen());
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            height: 200,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.grey.withOpacity(0.5),
            ),
            child: Image.network(
              '${APiMange.baseurlImage}/${catogery.img}',
              fit: BoxFit.fitHeight,
              height: 190,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            catogery.name ?? '',
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
