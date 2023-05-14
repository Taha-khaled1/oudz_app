import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/customtextfild.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/auth_widget/TextWithButtonTExt.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/siginup_screen/widget/AccpetPrivecy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';

class SiginUp_Screen extends StatelessWidget {
  const SiginUp_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Container(
        alignment: Alignment.center,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.05,
                  ),
                  Text(
                    'انشاء حساب جديد',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s25,
                    ),
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: ColorManager.background,
                    backgroundImage: const AssetImage('assets/images/logo.jpg'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'الاسم الاول',
                    width: 15,
                    height: 100,
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'الاسم الثاني',
                    width: 15,
                    height: 100,
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'الاماره',
                    width: 15,
                    height: 100,
                    icon: Icons.home,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'البريد الاكتروني',
                    width: 15,
                    height: 100,
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'رقم الهاتف',
                    width: 15,
                    height: 100,
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    obsecuer: true,
                    onsaved: (p0) {},
                    titel: 'كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    obsecuer: true,
                    onsaved: (p0) {},
                    titel: 'تاكيد كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AccpetPrivecy(),
                  CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'انشاء الحساب',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWithButtonTExt(
                    text1: 'امتلك  حساب؟',
                    text2: 'تسجيل الدخول',
                    onTap: () {
                      Get.to(() => const Login_Screen());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
