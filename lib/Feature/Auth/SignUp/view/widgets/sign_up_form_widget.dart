import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/dont_have_an_account_signup.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/widgets/custom_button.dart';
import 'package:desktop_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(70),
            Text(
              'Sign Up',
              style: AppTextStyle.fontWeightw500Size16Colorblack(),
            ),
            verticalSpace(30),
            Align(alignment: Alignment.bottomLeft, child: Text('First Name')),

            CustomTextFormField(
              hintText: 'first name',
              prefixIcon: Icons.person,
              color: Colors.grey,
            ),
            verticalSpace(10),
            Align(alignment: Alignment.bottomLeft, child: Text('Last Name')),

            CustomTextFormField(
              hintText: 'last name',
              prefixIcon: Icons.email_outlined,
              color: Colors.grey,
            ),
            verticalSpace(10),
            Align(alignment: Alignment.bottomLeft, child: Text('Email')),

            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              color: Colors.grey,
            ),
            verticalSpace(10),
            Align(alignment: Alignment.bottomLeft, child: Text('Password')),

            CustomTextFormField(
              obscureText: true,
              hintText: 'password',
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
            CustomButton(
              onPressed: () {},
              title: Text(
                'Sign In',
                style: AppTextStyle.fontWeightw400Size18ColorWhite(),
              ),
            ),
            verticalSpace(40),
            DontHaveAnAccountSignUp(),
          ],
        ),
      ),
    );
  }
}
