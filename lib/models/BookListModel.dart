import 'dart:convert';

import 'package:library_mobile/models/BookModel.dart';

class BookListModel {
  BookListModel({
    required this.results,
  });

  List<BookModel> results;

  factory BookListModel.fromJson(dynamic res) {
    var jsonData = json.decode(res);
    return BookListModel(
      results: List<BookModel>.from(
          jsonData["books"].map((x) => BookModel.fromJson(x))),
    );
  }
}
