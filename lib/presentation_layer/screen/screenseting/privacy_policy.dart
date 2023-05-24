import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oudz_app/presentation_layer/resources/strings_manager.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 1,
        backgroundColor: ColorManager.background,
      ),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbarscreen(AppStrings.privacy_policy.tr),
            Html(
              data: AppStrings.pri_content.tr,
            ),
          ],
        ),
      ),
    );
  }
}
