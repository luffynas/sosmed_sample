class BaseResponse {
  int code;
  String message;
  dynamic data;

  BaseResponse({required this.code, required this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        code: json['code'] as int,
        message: json['message'] as String,
        data: json['data'] as dynamic,
      );
}
