import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ImageWithBackButton extends StatelessWidget {
  const ImageWithBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.background,
          ),
          child: Image.asset(
            'assets/images/perfum.jpg',
            fit: BoxFit.contain,
            height: 500,
            width: 500,
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: BackButton(
            color: ColorManager.kPrimary,
          ),
        ),
      ],
    );
  }
}
