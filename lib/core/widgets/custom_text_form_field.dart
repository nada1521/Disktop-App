import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.kebordType,
    this.controller,
    this.validator,
    this.textCapitalization,
    this.obscureText = false,
    this.textAlig = TextAlign.left,
    this.title,
    this.onChanged,
    this.autovalidateMode,
    this.color,
    this.inputFormatters,
    this.prefixIcon,
  });
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? kebordType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final TextAlign textAlig;
  final Widget? title;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        // style: TextStyle(fontSize: 21, color: color ?? Colors.white),
        validator:
            validator ??
            (value) {
              if (value!.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
        inputFormatters: inputFormatters,
        textAlign: textAlig,
        keyboardType: kebordType,
        textInputAction: TextInputAction.next,
        controller: controller,
        // style: TextStyle(color:),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.grey,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),

             ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          enabled: true,
          label: title,
          hintText: hintText,
          // hintStyle: AppTextStyle.regularFontSize14Greay,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
