import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oudz_app/application_layer/ShardFunction/handling.dart';
import 'package:oudz_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:oudz_app/data_layer/function_resbon/resbons_all.dart';
import 'package:oudz_app/data_layer/models/favorit_model.dart';
import 'package:oudz_app/data_layer/models/product_model.dart';
import 'package:oudz_app/main.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  Future<bool> isProductInFavorites(int productId) async {
    Database? mydb = await sqlDb!.db;
    String sql = 'SELECT * FROM favorite WHERE id = $productId';
    List<Map<String, dynamic>> result = await mydb!.rawQuery(sql);

    return result.isNotEmpty;
  }

  void addfavorite(BuildContext context, FavoritModel favoritModel) async {
    try {
      var isFavorite = await sqlDb!.readData(
        'SELECT * FROM favorite WHERE id = ${favoritModel.id}',
      );
      print(isFavorite.toString());
      if (isFavorite.isNotEmpty) {
        // Product is already a favorite, so delete it
        int deletedRows = await sqlDb!.deleteData(
          'DELETE FROM favorite WHERE id = ${favoritModel.id}',
        );

        // if (deletedRows > 0) {
        //   showDilog(context, 'تم حذف المنتج من المفضله بنجاح',
        //       type: QuickAlertType.info);
        // }
      } else {
        // Product is not a favorite, so add it
        int respons = await sqlDb!.insert(
          'favorite',
          {
            'id': favoritModel.id,
            "titleEn": favoritModel.titleEn,
            "des": favoritModel.des,
            "price": favoritModel.price,
            'title': favoritModel.title,
            'image': favoritModel.image,
          },
        );

        // if (respons > 0) {
        //   showDilog(context, 'تم اضافة المنتج الي المفضله بنجاح');
        // }
      }
      update();
    } catch (e) {
      print(e);
    }
    update();
  }

  ProductModel? productModelstow;

  late StatusRequest statusRequest1;
  getAllproduct() async {
    try {
      statusRequest1 = StatusRequest.loading;
      var response = await getAllProductRespon();
      statusRequest1 = handlingData(response);
      if (statusRequest1 == StatusRequest.success) {
        print('----------------------------------');
        productModelstow = await ProductModel.fromJson(response);
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getAllproduct();
    super.onInit();
  }
}
