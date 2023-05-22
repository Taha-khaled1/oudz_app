import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/data_layer/models/cart_model.dart';
import 'package:oudz_app/main.dart';

import 'package:quickalert/quickalert.dart';

class CartController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  bool xtemp = false;
  bool ctemp = false;
  String deliveryType = '';

  void updatePay(String value) {
    deliveryType = value;
    update();
  }

  bool islooding = true;
  List<CartItem> cartItem = [];
  void getData() async {
    var responsev = await sqlDb!.readData("SELECT * FROM cart");
    for (var element in responsev) {
      cartItem.add(
        CartItem(
          des: element['des'],
          itemsName: element['itemsName'],
          itemsNameEn: element['itemsNameEn'],
          itemsImage: element['itemsImage'],
          itemsPrice: element['itemsPrice'],
          id: element['id'],
          count: count,
        ),
      );
    }
    islooding = false;
  }

  icrasingCount(int index, double price) {
    count++;
    cartItem[index].count++;
    totelPrice += price;
    update();
  }

  decrasingCount(int index, double price) {
    if (count > 1) {
      count--;
      cartItem[index].count--;
      totelPrice -= price;
      update();
    }
  }

  // StatusRequest statusRequest1 = StatusRequest.none;
  // saveOrder(BuildContext context, String id) async {
  //   statusRequest1 = StatusRequest.loading;
  //   update();

  //   var respon = await saveOrderRespon(id);
  //   statusRequest1 = handlingData(respon);
  //   try {
  //     if (StatusRequest.success == statusRequest1) {
  //       if (respon['result'].toString() == 'true') {
  //         carModelsdemo.clear();
  //         Get.offAndToNamed(Routes.sucssRoute);
  //       } else {
  //         showDilog(
  //           context,
  //           'عربة التسوق فارغه او الكميه غير متوفره',
  //           type: QuickAlertType.info,
  //         );
  //       }
  //     } else {
  //       showDilog(
  //         context,
  //         'يوجد مشكله بحساب المستخد يرجي التواصل مع الدعم',
  //         type: QuickAlertType.error,
  //       );
  //     }
  //   } catch (e) {
  //     print('catch $e');
  //     showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
  //   }

  //   update();
  // }
}
