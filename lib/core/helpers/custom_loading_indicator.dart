import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_colors.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.primary,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
