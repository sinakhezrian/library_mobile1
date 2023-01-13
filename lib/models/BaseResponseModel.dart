class BaseResponseModel {
  BaseResponseModel({
    required this.message,
    required this.success,
  });

  int success;
  int message;


  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        success: json["success"],
        message: json["message"],
      );
}
