import 'package:desktop_app/Feature/Auth/SignIn/logic/log_in_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/dont_have_an_account_signup.dart';
import 'package:desktop_app/Feature/Home/view/screen/home_screen.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/widgets/custom_button.dart';
import 'package:desktop_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/function/show_snak_bar.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    LogInCubit logInCubit = context.read<LogInCubit>();

    return Form(
      key: logInCubit.logInFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(100),
            Text(
              'Log In',
              style: AppTextStyle.fontWeightw500Size16Colorblack(),
            ),
            verticalSpace(70),
            Align(alignment: Alignment.bottomLeft, child: Text('Email')),

            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              controller: logInCubit.emailController,
              color: Colors.grey,
            ),
            verticalSpace(10),
            Align(alignment: Alignment.bottomLeft, child: Text('Password')),

            CustomTextFormField(
              obscureText: true,
              hintText: 'password',
              controller: logInCubit.passwordController,
              prefixIcon: Icons.lock_outlined,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.topRight,
              child: Text('Forget Password?'),
            ),
            verticalSpace(20),
            BlocConsumer<LogInCubit, LogInState>(
              listener: (context, state) {
                if (state is LogInSuccessState) {
                  pushReplacement(context, WebViewPage());
                } else if (state is LogInFailureState) {
                  showSnakBar(context, state.erroreMessag);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    logInCubit.emitLogInState();
                  },
                  title: state is LogInLoadingState
                      ? CustomLoadingIndicator()
                      : Text(
                          'Log In',
                          style: AppTextStyle.fontWeightw400Size18ColorWhite(),
                        ),
                );
              },
            ),
            verticalSpace(40),
            DontHaveAnAccountSignUp(),
          ],
        ),
      ),
    );
  }
}
