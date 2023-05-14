import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oudz_app/application_layer/ShardFunction/valid.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/customtextfild.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';

import 'address_controller/address_controller.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController controller = Get.put(AddressController());
    return Scaffold(
      bottomNavigationBar: const Navb(),
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('اضافة عنوان'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  AllFieldAddress(controller: controller),
                  const SizedBox(height: 15),
                  CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'حفظ العنوان',
                    press: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AllFieldAddress extends StatelessWidget {
  const AllFieldAddress({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AddressController controller;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: controller.formkeysigin,
            child: Column(
              children: [
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.country = p0.toString();
                  },
                  titel: 'اسمك كاملا',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.city = p0.toString();
                  },
                  titel: 'الاماره',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.post = p0.toString();
                  },
                  titel: 'المنطقه',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'phone');
                  },
                  onsaved: (p0) {
                    return controller.phone = p0.toString();
                  },
                  titel: 'المنزل/الشقه',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'phone');
                  },
                  onsaved: (p0) {
                    return controller.phone = p0.toString();
                  },
                  titel: 'البريد الاكتروني',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'phone');
                  },
                  onsaved: (p0) {
                    return controller.phone = p0.toString();
                  },
                  titel: 'رقم هاتفك',
                  width: deviceInfo.localWidth * 0.05,
                  height: 60,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
