import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/widgets/custom_button.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/add_products_view.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: S.of(context).addData,
            onPressed: () {
              Navigator.pushNamed(context, AddProductsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
