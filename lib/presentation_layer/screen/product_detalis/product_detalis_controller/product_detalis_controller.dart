import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductDetalisController extends GetxController {
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
}
