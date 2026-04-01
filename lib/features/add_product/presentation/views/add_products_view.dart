import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'add_products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).addProduct),
      body: AddProductViewBody(),
    );
  }
}
