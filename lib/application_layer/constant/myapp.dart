import 'package:oudz_app/application_layer/service/localizetion/changelangue.dart';
import 'package:oudz_app/application_layer/service/localizetion/translate.dart';
import 'package:oudz_app/presentation_layer/resources/routes_pages.dart';
import 'package:oudz_app/presentation_layer/resources/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: getApplicationTheme(),
      getPages: getPage,
      // home: Example(),
    );
  }
}
