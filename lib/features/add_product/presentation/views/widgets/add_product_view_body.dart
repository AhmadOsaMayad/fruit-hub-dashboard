import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: S.of(context).productName,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productPrice,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productCode,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).productDescription,
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              ImageField(),
            ],
          ),
        ),
      ),
    );
  }
}
