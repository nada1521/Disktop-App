import 'package:bloc/bloc.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/helper/shared_pref.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:flutter/material.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.loginRepo) : super(LogInInitialState());
  final LoginRepo loginRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> logInFormKey = GlobalKey();

  void emitLogInState() async {
    if (logInFormKey.currentState != null &&
        logInFormKey.currentState!.validate()) {
      emit(LogInLoadingState());
      final response = await loginRepo.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      response.when(
        success: (respons) async {
          await saveUserToken(respons.token);
          emit(LogInSuccessState(responseModel: respons));
        },
        failure: (error) => emit(LogInFailureState(erroreMessag: error)),
      );
    }
  }
}

Future<void> saveUserToken(String token) async {
  await AppSharedPrefs.setString(ShardPrefKeys.userToken, token);
}
