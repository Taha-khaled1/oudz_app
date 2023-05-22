import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ImageWithBackButton extends StatelessWidget {
  const ImageWithBackButton({
    super.key,
    required this.img,
  });
  final String img;
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
          child: Image.network(
            img,
            fit: BoxFit.cover,
            height: 500,
            width: 1000,
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
