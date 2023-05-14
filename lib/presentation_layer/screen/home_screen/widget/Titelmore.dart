// ignore: file_names
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class Titelmore extends StatelessWidget {
  const Titelmore({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth * 0.06, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary2,
                  fontSize: FontSize.s18,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  text2,
                  style: MangeStyles().getMediumStyle(
                    color: ColorManager.kPrimary2,
                    fontSize: FontSize.s16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
