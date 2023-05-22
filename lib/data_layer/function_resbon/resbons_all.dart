import 'package:oudz_app/data_layer/database/connectdatabase.dart';
import 'package:oudz_app/presentation_layer/resources/msnge_api.dart';

getAllCatogeryRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.getAllCatogeryRespon,
  );

  return respons;
}

getAllProductRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.getFeaturedProducts,
  );

  return respons;
}

getProductDetalisRespon(int idproduct) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.getProductdetalis}/$idproduct',
  );
  print(respons);
  return respons;
}
