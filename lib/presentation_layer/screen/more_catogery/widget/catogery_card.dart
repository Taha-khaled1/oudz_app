import 'package:flutter/material.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 6),
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.grey.withOpacity(0.5),
          ),
          child: Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.fitHeight,
            height: 190,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'عطور رجاليه',
          style: MangeStyles().getBoldStyle(
            color: ColorManager.ktextblackk,
            fontSize: FontSize.s18,
          ),
        ),
      ],
    );
  }
}
