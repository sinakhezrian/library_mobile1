import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_mobile/api/apiController.dart';
import 'package:library_mobile/models/BaseResponseModel.dart';

class AddBookController extends GetxController {
  RxString name = "".obs;
  RxString style = "".obs;
  RxString cover = "".obs;
  RxString writer = "".obs;
  RxString price = "".obs;
  RxString publishers = "".obs;

  RxBool closed = false.obs;

  save() async {
    var res = await ApiController.send(
        "/api/books/create",
        RequestType.post,
        jsonEncode({
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
