import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:oudz_app/presentation_layer/resources/strings_manager.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appbarscreen(AppStrings.terms_and_conditions.tr),
            SingleChildScrollView(
              child: Html(
                data: AppStrings.term_content.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
