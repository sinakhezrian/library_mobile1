import 'dart:convert';

class BaseResponseModel {
  BaseResponseModel({
    required this.message,
    required this.success,
  });

  bool success;
  String message;

  factory BaseResponseModel.fromJson(dynamic res) {
    var jsonData = json.decode(res);
    return BaseResponseModel(
      success: jsonData["success"],
      message: jsonData["message"],
    );
  }
}
