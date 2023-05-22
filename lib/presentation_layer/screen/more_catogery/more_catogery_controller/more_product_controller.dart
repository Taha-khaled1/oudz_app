import 'package:get/get.dart';
import 'package:oudz_app/application_layer/ShardFunction/handling.dart';
import 'package:oudz_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:oudz_app/data_layer/function_resbon/resbons_all.dart';
import 'package:oudz_app/data_layer/models/catogery_model.dart';

class MoreCatogeryController extends GetxController {
  CatogeryModel? catogeryModel;
  late StatusRequest statusRequest;
  getPropertyMostViset() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getAllCatogeryRespon();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        catogeryModel = await CatogeryModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getPropertyMostViset();
    super.onInit();
  }
}
