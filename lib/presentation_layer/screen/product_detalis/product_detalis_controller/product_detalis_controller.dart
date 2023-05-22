import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oudz_app/data_layer/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../main.dart';

class ProductDetalisController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  bool xtemp = false;
  bool ctemp = false;
  String deliveryType = '';
  Data data = Get.arguments['data'];
  void updatePay(String value) {
    deliveryType = value;
    update();
  }

  icrasingCount() {
    count++;

    update();
  }

  decrasingCount() {
    if (count > 1) {
      count--;

      update();
    }
  }

  Future<bool> isProductInFavorites(int productId) async {
    Database? mydb = await sqlDb!.db;
    String sql = 'SELECT * FROM favorite WHERE id = $productId';
    List<Map<String, dynamic>> result = await mydb!.rawQuery(sql);

    return result.isNotEmpty;
  }
  //   int idProperty = Get.arguments['id'];
  // PropertyDetalisModel? propertyDetalisModel;
  // late StatusRequest statusRequest;
  // getPropertyDetalis(int id) async {
  //   try {
  //     statusRequest = StatusRequest.loading;
  //     var response = await getAllDetalisRespon(id);
  //     statusRequest = handlingData(response);
  //     if (statusRequest == StatusRequest.success) {
  //       print('----------------------------------');
  //       propertyDetalisModel = await PropertyDetalisModel.fromJson(response);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     statusRequest = StatusRequest.erorr;
  //   }
  //   update();
  // }
}
