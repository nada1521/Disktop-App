import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccuntSignInText extends StatelessWidget {
  const AlreadyHaveAnAccuntSignInText({super.key, this.navigationPath});
  final Function? navigationPath;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have an account ? ",
        children: [
          TextSpan(
            text: "Sign In",
              recognizer: TapGestureRecognizer()
              ..onTap = (){}
          ),
        ],
      ),
    );
  }
}
