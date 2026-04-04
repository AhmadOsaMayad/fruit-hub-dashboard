import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/core/services/get_it_service.dart';
import 'package:fruithub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_consumer.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'add_products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).addProduct),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          productsRepo: getIt.get<ProductsRepo>(),
          imagesRepo: getIt.get<ImagesRepo>(),
        ),
        child: const AddProductViewBodyConsumer(),
      ),
    );
  }
}
