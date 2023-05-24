import 'package:oudz_app/main.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/custombutten.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/strings_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:oudz_app/presentation_layer/screen/account_screen/widget/customListtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/screen/address_screen/address_screen.dart';
import 'package:oudz_app/presentation_layer/screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:oudz_app/presentation_layer/screen/screenseting/aboutpage.dart';
import 'package:oudz_app/presentation_layer/screen/screenseting/privacy_policy.dart';
import 'package:oudz_app/presentation_layer/screen/screenseting/sharescreen.dart';
import 'package:oudz_app/presentation_layer/screen/screenseting/terms.dart';
import 'package:oudz_app/presentation_layer/screen/support_screen/support_problem_account_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navb(),
      backgroundColor: ColorManager.background,
      appBar: appbarscreen(AppStrings.account_information.tr),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    AppStrings.account.tr,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextblackk,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: const Icon(Icons.person),
                  titel: AppStrings.account_information.tr,
                  onTap: () {
                    Get.to(() => const EditProfileScreen());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.home),
                  titel: AppStrings.add_address.tr,
                  onTap: () {
                    Get.to(() => const AddressScreen());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.privacy_tip_outlined),
                  titel: AppStrings.privacy_policy.tr,
                  onTap: () {
                    Get.to(() => const PrivacyPolicy());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.policy_outlined),
                  titel: AppStrings.terms_and_conditions.tr,
                  onTap: () {
                    Get.to(TermsAndConditionsPage());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.share),
                  titel: AppStrings.share_app.tr,
                  onTap: () {
                    Get.to(() => const ShareApp());
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    AppStrings.help.tr,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextblackk,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: const Icon(Icons.call),
                  titel: AppStrings.connect_with_us.tr,
                  onTap: () {
                    Get.to(
                      () => const SupportProblemScreen(),
                    );
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.info_outline),
                  titel: AppStrings.about_us.tr,
                  onTap: () {
                    Get.to(() => const AboutPage());
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomSwitch(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.1),
                  child: CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: AppStrings.sign_out.tr,
                    press: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = sharedPreferences.getString('lang') == 'ar' ? false : true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: _value,
      onChanged: (value) {
        if (sharedPreferences.getString('lang') == 'ar') {
          print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          sharedPreferences.setString("lang", 'en');
          Get.updateLocale(Locale('en'));

          print(sharedPreferences.getString('lang'));
        } else {
          print('########################################');
          sharedPreferences.setString("lang", 'ar');
          Get.updateLocale(Locale('ar'));
        }
        setState(() {
          _value = !_value;
        });
      },
      title: Text(
        AppStrings.chang_lang.tr,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.ktextblackk,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
