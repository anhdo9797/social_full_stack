class BaseResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  BaseResponse({this.success = false, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
