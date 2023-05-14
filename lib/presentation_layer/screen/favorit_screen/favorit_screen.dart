import 'package:oudz_app/presentation_layer/components/appbar1.dart';
import 'package:oudz_app/presentation_layer/components/navbar.dart';
import 'package:oudz_app/presentation_layer/resources/color_manager.dart';
import 'package:oudz_app/presentation_layer/resources/font_manager.dart';
import 'package:oudz_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navb(),
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('المفضله'),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/perfum.jpg'),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'عطر وايت عود',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.ktextblackk,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'افحص التافصيل',
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
          );
        },
      ),
    );
  }
}
