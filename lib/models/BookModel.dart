import 'dart:convert';

class BookModel {
  BookModel({
    required this.id,
    required this.writer,
    required this.name,
    required this.cover,
    required this.style,
    required this.price,
    required this.publishers,
  });

  int id;
  String name;
  String writer;
  String cover;
  String style;
  String price;
  String publishers;

  factory BookModel.fromJson(dynamic res) {

    return BookModel(
      id: res["id"],
      name: res['name'],
      writer: res["writer"],
      cover: res["cover"],
      style: res["style"],
      price: res["price"],
      publishers: res["publishers"],
    );
  }
}
