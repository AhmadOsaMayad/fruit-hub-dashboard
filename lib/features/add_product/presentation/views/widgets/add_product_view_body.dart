import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/helpers/dp_helper.dart';
import 'package:fruithub_dashboard/core/widgets/custom_button.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithub_dashboard/core/widgets/date_picker_text_field.dart';
import 'package:fruithub_dashboard/core/widgets/is_featured_check_box.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/review_entity.dart';
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
  late TextEditingController? dpController;
  bool isFeaturedItem = false;
  File? selectedImage;
  late String productName, productCode, productDescription;
  String? expDate;
  late num productPrice, calPer100g;
  int quantity = 1, avgCount = 0;
  num avgRating = 0;

  @override
  initState() {
    super.initState();
    dpController = TextEditingController();
  }

  @override
  void dispose() {
    dpController?.dispose();
    super.dispose();
  }

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
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productName,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productName = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productPrice,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productCode,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: S.of(context).productQuantity,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: S.of(context).caloriesPer100g,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        calPer100g = num.parse(value!);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: S.of(context).reviews,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        avgCount = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: S.of(context).averageRating,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        avgRating = num.parse(value!);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DatePickerTextField(
                controller: dpController!,
                onDateSelected: (date) {
                  expDate = DpHelper.date2str(date);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productDescription,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productDescription = value!;
                },
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              ImageField(
                onImageChanged: (image) {
                  selectedImage = image;
                },
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeaturedItem = value;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: S.of(context).addProduct,
                onPressed: () {
                  if (selectedImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Perform the add product action with the collected data
                      ProductEntity input = ProductEntity(
                        image: selectedImage!,
                        imageUrl: null,
                        name: productName,
                        code: productCode,
                        description: productDescription,
                        price: productPrice,
                        quantity: quantity,
                        isFeatured: isFeaturedItem,
                        expDate: expDate!,
                        calPer100g: calPer100g,
                        avgRating: avgRating,
                        avgCount: avgCount,
                        reviews: [
                          ReviewEntity(
                            name: 'Ahmad Ousama',
                            image:
                                'https://cryphuqlipxsfrhjxvlk.supabase.co/storage/v1/object/public/fruits_images/images/437d41ba75e59232c85898c17602697f.jpg',
                            description: 'Great product!',
                            rating: 4.5,
                            date: '2026-04-01',
                          ),
                          ReviewEntity(
                            name: 'أحمد أسامة',
                            image:
                                'https://cryphuqlipxsfrhjxvlk.supabase.co/storage/v1/object/public/fruits_images/images/437d41ba75e59232c85898c17602697f.jpg',
                            description: 'منتج خلقة! بس بالعربي',
                            rating: 4.5,
                            date: '2026-04-01',
                          ),
                        ],
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
              const SizedBox(height: 24),
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
