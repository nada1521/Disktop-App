import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:desktop_app/core/network/api_service.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo({required this.apiService});
  Future<ApiResult<LogInResponseModel>> login(
    LoginRequestBody requestBody,
  ) async {
    try {
      final response = await apiService.login(
        requestBody.email,
        requestBody.password
      );
      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(e.toString());
    }
  }
}
