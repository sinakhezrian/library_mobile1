import 'dart:convert';

import 'package:library_mobile/api/apiController.dart';
import 'package:library_mobile/models/BookListModel.dart';
import 'package:library_mobile/models/BookModel.dart';

class BookController {
  static List<BookModel> books = [];
  static getList() async {
    var res =
        await ApiController.send("api/books/read", RequestType.get, {}, {});
    var list = BookListModel.fromJson(res.body);
    BookController.books = list.results;
  }
}
