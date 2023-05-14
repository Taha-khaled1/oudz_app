import 'package:oudz_app/presentation_layer/Infowidget/models/device_info.dart';
import 'package:oudz_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/home_screen.dart';

import 'more_product_controller/more_product_controller.dart';

class MoreProductScreen extends StatelessWidget {
  const MoreProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final MoreProductController controller = Get.put(MoreProductController());
    return Scaffold(
      bottomNavigationBar: Navb(),
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('النتائج'),
      body: GetBuilder<MoreProductController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InfoWidget(
              builder: (context, deviceInfo) {
                return 1 == 2
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: Text(
                          //     'النتائج',
                          //     style: MangeStyles().getRegularStyle(
                          //       color: ColorManager.kPrimary,
                          //       fontSize: FontSize.s25,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Expanded(
                            child: GridView.builder(
                              // controller: controller.controller,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio:
                                    getChildAspectRatio(deviceInfo),
                              ),
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCard(
                                    // image: 'assets/images/image 22.png',
                                    );
                              },
                            ),
                          ),

                          // if (controller.isLoadMoreRunning == true)
                          //   const Padding(
                          //     padding: EdgeInsets.only(top: 10, bottom: 40),
                          //     child: Center(
                          //       child: CircularProgressIndicator(),
                          //     ),
                          //   ),
                          // if (controller.hasNextPage == false)
                          //   Center(
                          //     child: Text(
                          //       'تم تجلب كل المنتجات',
                          //       style: MangeStyles().getRegularStyle(
                          //         color: ColorManager.kPrimary,
                          //         fontSize: FontSize.s20,
                          //       ),
                          //     ),
                          //   ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
              },
            ),
          );
        },
      ),
    );
  }
}

double getChildAspectRatio(DeviceInfo deviceInfo) {
  print(deviceInfo.localHeight);
  if (deviceInfo.localHeight < 680) {
    return 0.57;
  } else if (deviceInfo.localHeight < 845) {
    return 0.60;
  } else if (deviceInfo.localHeight < 1000) {
    return 0.85;
  } else {
    return 1.2;
  }
}
