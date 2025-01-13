import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:social/data/models/response/base_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/api/auth/login")
  Future<BaseResponse> login(@Body() Map<String, dynamic> body);

  @POST("/api/auth/register")
  Future<BaseResponse> register(@Body() Map<String, dynamic> body);
}
