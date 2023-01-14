import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_mobile/api/apiController.dart';
import 'package:library_mobile/models/BaseResponseModel.dart';

class EditBookController extends GetxController {
  static RxInt id = 0.obs;
  static RxString name = "".obs;
  static RxString style = "".obs;
  static RxString cover = "".obs;
  static RxString writer = "".obs;
  static RxString price = "".obs;
  static RxString publishers = "".obs;

  static RxBool closed = false.obs;

  static save() async {
    var res = await ApiController.send(
        "/api/books/update",
        RequestType.put,
        jsonEncode({
          'id': id.value,
          'name': name.value,
          'style': style.value,
          'cover': cover.value,
          'writer': writer.value,
          'publishers': publishers.value,
          'price': price.value,
        }),
        {
          'Content-Type': 'application/json; charset=utf-8',
        });
    var data = BaseResponseModel.fromJson(res.body);
    if (data.success == true) {
      closed.value = true;
    }
  }
}
