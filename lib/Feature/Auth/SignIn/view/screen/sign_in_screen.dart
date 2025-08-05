import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/log_in_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/sign_in_form_widget.dart';
import 'package:desktop_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(getIt.get<LoginRepo>()),
      child: Scaffold(body: SignInFormWidget()),
    );
  }
}
