import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/data/api/api_client.dart';
import 'package:social/data/api/auth_api.dart';
import 'package:social/data/models/response/base_response.dart';
import 'package:social/data/models/response/login_data/login_data.dart';

class AuthRepository {
  AuthRepository(this._ref);
  final Ref _ref;

  late final AuthApi _authApi = AuthApi(_ref.read(apiClientProvider));

  Future<BaseResponse<LoginData>> login(String email, String password) async {
    try {
      // final response = await _ref.read(apiClientProvider).post(
      //   "/api/auth/login",
      //   data: {
      //     "email": email,
      //     "password": password,
      //   },
      // );
      final response = await _authApi.login({
        "email": email,
        "password": password,
      });

      return BaseResponse<LoginData>(
        success: response.success,
        message: response.message,
        data: LoginData.fromJson(response.data),
      );
    } catch (e) {
      throw e;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref);
});
