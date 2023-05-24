import 'package:get/get.dart';
import 'package:oudz_app/main.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/strings_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:oudz_app/presentation_layer/screen/favorit_screen/favorit_controller.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navb(),
      backgroundColor: ColorManager.background,
      appBar: appbarscreen(AppStrings.favorite.tr),
      body: GetBuilder<FavoritController>(
        init: FavoritController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.getData(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            backgroundImage: NetworkImage(
                                snapshot.data?[index]['image'].toString() ??
                                    ''),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                (sharedPreferences.getString('lang') == 'ar'
                                        ? snapshot.data![index]['title']
                                        : snapshot.data?[index]['titleEn']) ??
                                    '',
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.ktextblackk,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                AppStrings.examine_the_details.tr,
                                style: MangeStyles().getBoldStyle(
                                  color: Colors.grey,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
