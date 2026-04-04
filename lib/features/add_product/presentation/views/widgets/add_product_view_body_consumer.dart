import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/helpers/build_snack_bar.dart';
import 'package:fruithub_dashboard/core/helpers/custom_loading_indicator.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyConsumer extends StatelessWidget {
  const AddProductViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          buildSnackBar(context, state.errorMessage);
        } else if (state is AddProductSuccess) {
          buildSnackBar(context, 'Product added successfully');
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
