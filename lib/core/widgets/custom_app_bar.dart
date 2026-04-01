import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19,
    ),
  );
}
