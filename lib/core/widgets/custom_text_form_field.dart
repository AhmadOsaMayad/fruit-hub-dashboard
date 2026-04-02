import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.validator,
    this.controller,
    this.onSaved,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscure = false,
    this.readOnly = false,
    this.maxLines = 1,
    super.key,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscure, readOnly;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      obscuringCharacter: '•',
      obscureText: obscure,
      maxLines: maxLines,
      onSaved: onSaved,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).pleaseFillThisField;
            }
            return null;
          },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        hintText: hintText ?? '',
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
    );
  }
}
