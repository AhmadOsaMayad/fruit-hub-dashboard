import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/add_products_view.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductsView());

    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
