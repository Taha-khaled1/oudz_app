import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/customtextfild.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/auth_widget/TextWithButtonTExt.dart';
import 'package:oudz_app/presentation_layer/screen/auth_screen/siginup_screen/siginup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResertPasswordScreen extends StatelessWidget {
  const ResertPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('تعيين كلمة مرور جديدة'),
      body: Container(
        alignment: Alignment.topCenter,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'أدخل كلمة المرور الجديدة أدناه وتحقق من التلميح أثناء تعيينه.',
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s18,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    obsecuer: true,
                    onsaved: (p0) {},
                    titel: 'كلمة السر الجديده',
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
                    titel: ' تاكيد كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'تسجيل الدخول',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 15,
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
