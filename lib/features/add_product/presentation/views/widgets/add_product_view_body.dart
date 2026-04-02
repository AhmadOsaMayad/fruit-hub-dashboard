import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/widgets/custom_button.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithub_dashboard/core/widgets/is_featured_check_box.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFeaturedItem = false;
  File? selectedImage;
  late String productName, productCode, productDescription;
  late num productPrice;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productName,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productName = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productPrice,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productCode,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productQuantity,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  quantity = int.parse(value!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productDescription,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productDescription = value!;
                },
                maxLines: 5,
              ),
              SizedBox(height: 16),
              ImageField(
                onImageChanged: (image) {
                  selectedImage = image;
                },
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeaturedItem = value;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                text: S.of(context).addProduct,
                onPressed: () {
                  if (selectedImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Perform the add product action with the collected data
                      AddProductEntity input = AddProductEntity(
                        image: selectedImage!,
                        imageUrl: null,
                        name: productName,
                        code: productCode,
                        description: productDescription,
                        price: productPrice,
                        quantity: quantity,
                        isFeatured: isFeaturedItem,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).pleaseSelectAnImage),
        backgroundColor: Colors.red,
      ),
    );
  }
}
