import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/data/api/api_client.dart';
import 'package:social/data/models/response/base_response.dart';
import 'package:social/data/models/response/login_data/login_data.dart';

class AuthRepository {
  AuthRepository(this._ref);
  final Ref _ref;

  Future<BaseResponse<LoginData>> login(String email, String password) async {
    try {
      final response = await _ref.read(apiClientProvider).post(
        "/api/auth/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      final data = BaseResponse.fromJson(response.data);

      return BaseResponse<LoginData>(
        success: data.success,
        message: data.message,
        data: LoginData.fromJson(data.data),
      );
    } catch (e) {
      throw e;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref);
});
