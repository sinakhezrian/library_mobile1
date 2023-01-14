import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_mobile/api/apiController.dart';
import 'package:library_mobile/models/BaseResponseModel.dart';
import 'package:library_mobile/models/BookListModel.dart';
import 'package:library_mobile/models/BookModel.dart';

class BookController extends GetxController {
  static RxList<BookModel> books = new RxList<BookModel>();
  static bool loading = false;
  static getList() async {
    loading = true;
    var res =
        await ApiController.send("api/books/read", RequestType.get, {}, {});
    var list = BookListModel.fromJson(res.body);
    BookController.books.value = list.results;
    print("get data");
    loading = false;
  }

  static delete(int id) async {
    loading = true;
    var res = await ApiController.send(
        "api/books/distroy",
        RequestType.post,
        jsonEncode({
          'id': id,
        }),
        {
          'Content-Type': 'application/json; charset=utf-8',
        });
    var data = BaseResponseModel.fromJson(res.body);
    // print("get data");
    loading = false;
    if (data.success == true) {
      BookController.getList();
    }
  }
}
