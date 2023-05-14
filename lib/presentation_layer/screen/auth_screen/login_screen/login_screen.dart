import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/customtextfild.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/auth_widget/DoubleDivider.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/auth_widget/SocialIcon.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/auth_widget/TextWithButtonTExt.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/forgot%20_password_screen/forgot_password_screen.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/siginup_screen/siginup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/home_screen.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({Key? key}) : super(key: key);
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
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'مرحبًا،\nمرحبًا بعودتك مجددا',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s25,
                      ),
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
                    obsecuer: true,
                    onsaved: (p0) {},
                    titel: 'كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.03,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPassword_Screen());
                        },
                        child: Text(
                          'نسيت كلمة السر',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary2,
                            fontSize: FontSize.s20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'تسجيل الدخول',
                    press: () {
                      Get.to(() => const HomeScreen());
                    },
                  ),
                  TextWithButtonTExt(
                    text1: 'ليس لديك حساب؟',
                    text2: 'اشتراك',
                    onTap: () {
                      Get.to(() => const SiginUp_Screen());
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
